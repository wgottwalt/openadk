/*
 * Copyright (C) 2009 Junjiro Okajima
 *
 * This program, aufs is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#define _ATFILE_SOURCE
#define _GNU_SOURCE
#define _REENTRANT

#include <linux/aufs_type.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/vfs.h>    /* or <sys/statfs.h> */
#include <assert.h>
#include <dirent.h>
#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <search.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "compat.h"

/* ---------------------------------------------------------------------- */

struct rdu {
#ifdef AuRDU_REENTRANT
	pthread_rwlock_t lock;
#else
	struct dirent de;
#endif

	int fd;

	unsigned long npos, idx;
	struct au_rdu_ent **pos;

	unsigned long nent, sz;
	struct au_rdu_ent *ent;

	int shwh;
	struct au_rdu_ent *real, *wh;
};

static struct rdu **rdu;
#define RDU_STEP 8
static int rdu_cur, rdu_lim = RDU_STEP;

/* ---------------------------------------------------------------------- */

/* #define RduLocalTest */
#ifdef RduLocalTest
static int rdu_test_data(struct rdu *p, int err)
{
	struct au_rdu_ent *e = p->ent;
	static int i;

	if (!i++) {
		err = 3;
		e->ino = e->type = e->nlen = 1;
		strcpy(e->name, ".");
		e += au_rdu_len(e->nlen);
		e->ino = e->type = e->nlen = 2;
		strcpy(e->name, "..");
		e += au_rdu_len(e->nlen);
		e->ino = e->type = e->nlen = 3;
		strcpy(e->name, "foo");
	} else
		err = 0;

	return err;
}
#else
static int rdu_test_data(struct rdu *p, int err)
{
	return err;
}
#endif

/* #define RduDebug */
#ifdef RduDebug
#define DPri(fmt, args...)	fprintf(stderr, "%s:%d: " fmt, \
					__func__, __LINE__, ##args)
#else
#define DPri(fmt, args...)	do {} while (0)
#endif

/* ---------------------------------------------------------------------- */

#ifdef AuRDU_REENTRANT
static void rdu_rwlock_init(struct rdu *p)
{
	pthread_rwlock_init(&p->lock);
}

static void rdu_read_lock(struct rdu *p)
{
	pthread_rwlock_rdlock(&p->lock);
}

static void rdu_write_lock(struct rdu *p)
{
	pthread_rwlock_wrlock(&p->lock);
}

static void rdu_unlock(struct rdu *p)
{
	pthread_rwlock_unlock(&p->lock);
}

static pthread_mutex_t rdu_lib_mtx = PTHREAD_MUTEX_INITIALIZER;
#define rdu_lib_lock()		pthread_mutex_lock(&rdu_lib_mtx)
#define rdu_lib_unlock()	pthread_mutex_unlock(&rdu_lib_mtx)
#define rdu_lib_must_lock()	assert(pthread_mutex_trylock(&rdu_lib_mtx))
#else
static void rdu_rwlock_init(struct rdu *p)
{
	/* empty */
}

static void rdu_read_lock(struct rdu *p)
{
	/* empty */
}

static void rdu_write_lock(struct rdu *p)
{
	/* empty */
}

static void rdu_unlock(struct rdu *p)
{
	/* empty */
}

#define rdu_lib_lock()		do {} while(0)
#define rdu_lib_unlock()	do {} while(0)
#define rdu_lib_must_lock()	do {} while(0)
#endif

/*
 * initialize this library, particularly global variables.
 */
static int rdu_lib_init(void)
{
	int err;

	err = 0;
	if (rdu)
		goto out;

	rdu_lib_lock();
	if (!rdu) {
		rdu = calloc(rdu_lim, sizeof(*rdu));
		err = !rdu;
	}
	rdu_lib_unlock();

 out:
	return err;
}

static int rdu_append(struct rdu *p)
{
	int err, i;
	void *t;

	rdu_lib_must_lock();

	err = 0;
	if (rdu_cur < rdu_lim - 1)
		rdu[rdu_cur++] = p;
	else {
		t = realloc(rdu, rdu_lim + RDU_STEP * sizeof(*rdu));
		if (t) {
			rdu = t;
			rdu_lim += RDU_STEP;
			rdu[rdu_cur++] = p;
			for (i = 0; i < RDU_STEP - 1; i++)
				rdu[rdu_cur + i] = NULL;
		} else
			err = -1;
	}

	return err;
}

/* ---------------------------------------------------------------------- */

static struct rdu *rdu_new(int fd)
{
	struct rdu *p;
	int err;

	p = malloc(sizeof(*p));
	if (p) {
		rdu_rwlock_init(p);
		p->fd = fd;
		p->sz = BUFSIZ;
		p->ent = malloc(BUFSIZ);
		if (p->ent) {
			err = rdu_append(p);
			if (!err)
				goto out; /* success */
		}
	}
	free(p);
	p = NULL;

 out:
	return p;
}

static struct rdu *rdu_buf_lock(int fd)
{
	struct rdu *p;
	int i;

	assert(rdu);
	assert(fd >= 0);

	p = NULL;
	rdu_lib_lock();
	for (i = 0; i < rdu_cur; i++)
		if (rdu[i] && rdu[i]->fd == fd) {
			p = rdu[i];
			goto out;
		}

	for (i = 0; i < rdu_cur; i++)
		if (rdu[i] && rdu[i]->fd == -1) {
			p = rdu[i];
			p->fd = fd;
			goto out;
		}
	if (!p)
		p = rdu_new(fd);

 out:
	if (p)
		rdu_write_lock(p);
	rdu_lib_unlock();

	return p;
}

static void rdu_free(int fd)
{
	struct rdu *p;

	p = rdu_buf_lock(fd);
	if (p) {
		free(p->ent);
		free(p->pos);
		p->fd = -1;
		p->ent = NULL;
		p->pos = NULL;
		rdu_unlock(p);
	}
}

/* ---------------------------------------------------------------------- */

static int rdu_do_store(int dirfd, struct au_rdu_ent *ent,
			struct au_rdu_ent **pos, struct rdu *p)
{
	int err;
	unsigned char c;
	struct stat st;

	c = ent->name[ent->nlen];
	ent->name[ent->nlen] = 0;
	DPri("%s\n", ent->name);
	err = fstatat(dirfd, ent->name, &st, AT_SYMLINK_NOFOLLOW);
	ent->name[ent->nlen] = c;
	if (!err) {
		ent->ino = st.st_ino;
		pos[p->idx++] = ent;
	} else {
		DPri("err %d\n", err);
		if (errno == ENOENT)
			err = 0;
	}

	return err;
}

struct rdu_thread_arg {
	int pipefd;
	struct rdu *p;
};

static void *rdu_thread(void *_arg)
{
	int err, pipefd, dirfd;
	ssize_t ssz;
	struct rdu_thread_arg *arg = _arg;
	struct au_rdu_ent *ent, **pos;
	struct rdu *p;

	pipefd = arg->pipefd;
	p = arg->p;
	dirfd = p->fd;
	pos = p->pos;
	while (1) {
		DPri("read\n");
		ssz = read(pipefd, &ent, sizeof(ent));
		DPri("ssz %zd\n", ssz);
		if (ssz != sizeof(ent) || !ent) {
			//perror("read");
			break;
		}

		//DPri("%p\n", ent);
		err = rdu_do_store(dirfd, ent, pos, p);
	}

	DPri("here\n");
	return NULL;
}

static int rdu_store(struct rdu *p, struct au_rdu_ent *ent, int pipefd)
{
#ifdef RduLocalTest
	if (ent)
		return rdu_do_store(p->fd, ent, p->pos, p);
	return 0;
#else
	ssize_t ssz;

	//DPri("%p\n", ent);
	ssz = write(pipefd, &ent, sizeof(ent));
	DPri("ssz %zd\n", ssz);
	//sleep(1);
	return ssz != sizeof(ent);
#endif
}

/* ---------------------------------------------------------------------- */
/* the heart of this library */

static void rdu_tfree(void *node)
{
	/* empty */
}

static int rdu_ent_compar(const void *_a, const void *_b)
{
	int ret;
	const struct au_rdu_ent *a = _a, *b = _b;

	ret = (int)a->nlen - b->nlen;
	if (!ret)
		ret = memcmp(a->name, b->name, a->nlen);
	return ret;
}

static int rdu_ent_compar_wh(const void *_a, const void *_b)
{
	int ret;
	const struct au_rdu_ent *real = _a, *wh = _b;

	if (real->nlen >= AUFS_WH_PFX_LEN
	    && !memcmp(real->name, AUFS_WH_PFX, AUFS_WH_PFX_LEN)) {
		wh = _a;
		real = _b;
	}

	ret = (int)wh->nlen - AUFS_WH_PFX_LEN - real->nlen;
	if (!ret)
		ret = memcmp(wh->name + AUFS_WH_PFX_LEN, real->name,
			     real->nlen);
	return ret;
}

/* tsearch(3) may not be thread-safe */
static int rdu_ent_append(struct rdu *p, struct au_rdu_ent *ent, int pipefd)
{
	int err;
	struct au_rdu_ent *e;

	err = 0;
	e = tfind(ent, (void *)&p->wh, rdu_ent_compar_wh);
	if (e)
		goto out;

	e = tsearch(ent, (void *)&p->real, rdu_ent_compar);
	if (e)
		err = rdu_store(p, ent, pipefd);
	else
		err = -1;

 out:
	return err;
}

static int rdu_ent_append_wh(struct rdu *p, struct au_rdu_ent *ent, int pipefd)
{
	int err;
	struct au_rdu_ent *e;

	err = 0;
	e = tfind(ent, (void *)&p->wh, rdu_ent_compar);
	if (e)
		goto out;

	e = tsearch(ent, (void *)&p->wh, rdu_ent_compar);
	if (e) {
		if (p->shwh)
			err = rdu_store(p, ent, pipefd);
	} else
		err = -1;

 out:
	return err;
}

static int rdu_merge(struct rdu *p)
{
	int err;
	unsigned long ul;
	pthread_t th;
	int fds[2];
	struct rdu_thread_arg arg;
	struct au_rdu_ent *ent;
	void *t;

	err = -1;
	p->pos = malloc(sizeof(*p->pos) * p->npos);
	if (!p->pos)
		goto out;

	/* pipe(2) may not be scheduled well in linux-2.6.23 and earlier */
	err = pipe(fds);
	if (err)
		goto out_free;

	arg.pipefd = fds[0];
	arg.p = p;
#ifndef RduLocalTest
	err = pthread_create(&th, NULL, rdu_thread, &arg);
#endif
	if (err)
		goto out_close;

	p->real = NULL;
	p->wh = NULL;
	ent = p->ent;
	for (ul = 0; !err && ul < p->npos; ul++) {
		if (ent->nlen <= AUFS_WH_PFX_LEN
		    || strncmp(ent->name, AUFS_WH_PFX, AUFS_WH_PFX_LEN))
			err = rdu_ent_append(p, ent, fds[1]);
		else
			err = rdu_ent_append_wh(p, ent, fds[1]);
		ent += au_rdu_len(ent->nlen);
	}
	rdu_store(p, /*ent*/NULL, fds[1]); /* terminate the thread */
	tdestroy(p->real, rdu_tfree);
	tdestroy(p->wh, rdu_tfree);

#ifndef RduLocalTest
	pthread_join(th, NULL);
#endif
	p->npos = p->idx;
	t = realloc(p->pos, sizeof(*p->pos) * p->npos);
	if (t)
		p->pos = t;
	/* t == NULL is not an error */

 out_close:
	close(fds[1]);
	close(fds[0]);
	if (!err)
		goto out; /* success */
 out_free:
	free(p->pos);
	p->pos = NULL;
 out:
	return err;
}

static int rdu_init(struct rdu *p)
{
	int err;
	struct aufs_rdu param;
	char *t;

	memset(&param, 0, sizeof(param));
	param.ent = p->ent;
	param.sz = p->sz;
	t = getenv("AUFS_RDU_BLK");
	if (t)
		param.blk = strtoul(t + sizeof("AUFS_RDU_BLK"), NULL, 0);

	do {
		err = ioctl(p->fd, AUFS_CTL_RDU, &param);
		err = rdu_test_data(p, err);
		if (err > 0) {
			p->npos += err;
			if (!param.full)
				continue;

			assert(param.blk);
			t = realloc(p->ent, p->sz + param.blk);
			if (t) {
				param.sz = param.blk;
				param.ent = (void *)(t + p->sz);
				p->ent = (void *)t;
				p->sz += param.blk;
			} else
				err = -1;
		}
	} while (err > 0);
	p->shwh = param.shwh;
	if (!err)
		err = rdu_merge(p);

	if (err) {
		free(p->ent);
		p->ent = NULL;
	}

	return err;
}

static int rdu_pos(struct dirent *de, struct rdu *p, long pos)
{
	int err;
	struct au_rdu_ent *ent;

	err = -1;
	if (pos <= p->npos) {
		ent = p->pos[pos];
		de->d_ino = ent->ino;
		de->d_off = pos;
		de->d_reclen = sizeof(*ent) + ent->nlen;
		de->d_type = ent->type;
		memcpy(de->d_name, ent->name, ent->nlen);
		de->d_name[ent->nlen] = 0;
		err = 0;
	}
	return err;
}

/* ---------------------------------------------------------------------- */

static struct dirent *(*real_readdir)(DIR *dir);
static int (*real_readdir_r)(DIR *dir, struct dirent *de, struct dirent **rde);
static int (*real_closedir)(DIR *dir);

static int rdu_dl(void **real, char *sym)
{
	char *p;

	if (*real)
		return 0;

	dlerror(); /* clear */
	*real = dlsym(RTLD_NEXT, sym);
	p = dlerror();
	if (p)
		fprintf(stderr, "%s\n", p);
	return !!p;
}

#define RduDlFunc(sym) \
static int rdu_dl_##sym(void) \
{ \
	return rdu_dl((void *)&real_##sym, #sym); \
}

RduDlFunc(readdir);
RduDlFunc(closedir);

#ifdef AuRDU_REENTRANT
RduDlFunc(readdir_r);
#else
#define rdu_dl_readdir_r()	1
#endif

/* ---------------------------------------------------------------------- */

static int rdu_readdir(DIR *dir, struct dirent *de, struct dirent **rde)
{
	int err, fd;
	struct rdu *p;
	long pos;
	struct statfs stfs;

	if (rde)
		*rde = NULL;

	errno = EBADF;
	fd = dirfd(dir);
	err = fd;
	if (fd < 0)
		goto out;

	err = fstatfs(fd, &stfs);
	if (err)
		goto out;

	if (
#ifdef RduLocalTest
		1 ||
#endif
		stfs.f_type == AUFS_SUPER_MAGIC) {
		err = rdu_lib_init();
		if (err)
			goto out;

		p = rdu_buf_lock(fd);
		if (!p)
			goto out;

		pos = telldir(dir);
		if (!pos || !p->npos) {
			err = rdu_init(p);
			rdu_unlock(p);
		}
		if (err)
			goto out;

		rdu_read_lock(p);
		if (!de)
			de = &p->de;
		err = rdu_pos(de, p, pos);
		rdu_unlock(p);
		if (!err) {
			*rde = de;
			seekdir(dir, pos + 1);
		}
	} else if (!de) {
		if (!rdu_dl_readdir()) {
			err = 0;
			*rde = real_readdir(dir);
			if (!*rde)
				err = -1;
		}
	} else {
		if (!rdu_dl_readdir_r())
			err = real_readdir_r(dir, de, rde);
	}
 out:
	return err;
}

struct dirent *readdir(DIR *dir)
{
	struct dirent *de;
	int err;

	err = rdu_readdir(dir, NULL, &de);
	DPri("err %d\n", err);
	return de;
}

#ifdef AuRDU_REENTRANT
int readdir_r(DIR *dirp, struct dirent *de, struct dirent **rde)
{
	return rdu_readdir(dir, de, rde);
}
#endif

int closedir(DIR *dir)
{
	int err, fd;
	struct statfs stfs;

	errno = EBADF;
	fd = dirfd(dir);
	if (fd < 0)
		goto out;
	err = fstatfs(fd, &stfs);
	if (err)
		goto out;

	if (stfs.f_type == AUFS_SUPER_MAGIC)
		rdu_free(fd);
	if (!rdu_dl_closedir())
		err = real_closedir(dir);

 out:
	return err;
}

#if 0
extern DIR *opendir (__const char *__name) __nonnull ((1));
extern int closedir (DIR *__dirp) __nonnull ((1));
extern struct dirent *__REDIRECT (readdir, (DIR *__dirp), readdir64)
     __nonnull ((1));
extern struct dirent64 *readdir64 (DIR *__dirp) __nonnull ((1));
extern int readdir_r (DIR *__restrict __dirp,
		      struct dirent *__restrict __entry,
		      struct dirent **__restrict __result)
     __nonnull ((1, 2, 3));
extern int readdir64_r (DIR *__restrict __dirp,
			struct dirent64 *__restrict __entry,
			struct dirent64 **__restrict __result)
     __nonnull ((1, 2, 3));
extern void rewinddir (DIR *__dirp) __THROW __nonnull ((1));
extern void seekdir (DIR *__dirp, long int __pos) __THROW __nonnull ((1));
extern long int telldir (DIR *__dirp) __THROW __nonnull ((1));
extern int dirfd (DIR *__dirp) __THROW __nonnull ((1));
extern int scandir (__const char *__restrict __dir,
		    struct dirent ***__restrict __namelist,
		    int (*__selector) (__const struct dirent *),
		    int (*__cmp) (__const void *, __const void *))
     __nonnull ((1, 2));
extern int scandir64 (__const char *__restrict __dir,
		      struct dirent64 ***__restrict __namelist,
		      int (*__selector) (__const struct dirent64 *),
		      int (*__cmp) (__const void *, __const void *))
     __nonnull ((1, 2));
extern int alphasort (__const void *__e1, __const void *__e2)
     __THROW __attribute_pure__ __nonnull ((1, 2));
extern int alphasort64 (__const void *__e1, __const void *__e2)
     __THROW __attribute_pure__ __nonnull ((1, 2));
extern int versionsort (__const void *__e1, __const void *__e2)
     __THROW __attribute_pure__ __nonnull ((1, 2));
extern int versionsort64 (__const void *__e1, __const void *__e2)
     __THROW __attribute_pure__ __nonnull ((1, 2));
extern __ssize_t getdirentries (int __fd, char *__restrict __buf,
				size_t __nbytes,
				__off_t *__restrict __basep)
     __THROW __nonnull ((2, 4));
extern __ssize_t getdirentries64 (int __fd, char *__restrict __buf,
				  size_t __nbytes,
				  __off64_t *__restrict __basep)
     __THROW __nonnull ((2, 4));
#endif
