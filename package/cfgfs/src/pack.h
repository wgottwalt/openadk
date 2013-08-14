/* $MirOS: contrib/hosted/fwcf/pack.h,v 1.13 2007/03/09 21:10:29 tg Exp $ */

/*
 * This file is part of the FreeWRT project. FreeWRT is copyrighted
 * material, please see the LICENCE file in the top-level directory
 * or at http://www.freewrt.org/licence for details.
 */

#ifndef PACK_H
#define PACK_H

#include <sys/types.h>

struct FTSF_ENTRY;
#ifndef FTS_SUBS_H
typedef struct FTSF_ENTRY ftsf_entry;
#endif

/* XXX use macros from minilzop.h */

#define STOREB(x) do {				\
		if (hdrleft < 1)		\
			return (NULL);		\
		*hdrptr++ = (x) & 0xFF;		\
		--hdrleft;			\
	} while (0)

#define STOREW(x) do {				\
		if (hdrleft < 2)		\
			return (NULL);		\
		*hdrptr++ = (x) & 0xFF;		\
		*hdrptr++ = ((x) >> 8) & 0xFF;	\
		hdrleft -= 2;			\
	} while (0)

#define STORET(x) do {				\
		if (hdrleft < 3)		\
			return (NULL);		\
		*hdrptr++ = (x) & 0xFF;		\
		*hdrptr++ = ((x) >> 8) & 0xFF;	\
		*hdrptr++ = ((x) >> 16) & 0xFF;	\
		hdrleft -= 3;			\
	} while (0)

#define STORED(x) do {				\
		if (hdrleft < 4)		\
			return (NULL);		\
		*hdrptr++ = (x) & 0xFF;		\
		*hdrptr++ = ((x) >> 8) & 0xFF;	\
		*hdrptr++ = ((x) >> 16) & 0xFF;	\
		*hdrptr++ = ((x) >> 24) & 0xFF;	\
		hdrleft -= 4;			\
	} while (0)

#define LOADW(x) __extension__({		\
		u_int8_t *lwbf = (u_int8_t *)(x);	\
		u_int32_t res = 0;		\
		res = (res << 8) | lwbf[1];	\
		res = (res << 8) | lwbf[0];	\
		res;				\
	})

#define LOADT(x) __extension__({		\
		u_int8_t *lwbf = (u_int8_t *)(x);	\
		u_int32_t res = 0;		\
		res = (res << 8) | lwbf[2];	\
		res = (res << 8) | lwbf[1];	\
		res = (res << 8) | lwbf[0];	\
		res;				\
	})

#define LOADD(x) __extension__({		\
		u_int8_t *lwbf = (u_int8_t *)(x);	\
		u_int32_t res = 0;		\
		res = (res << 8) | lwbf[3];	\
		res = (res << 8) | lwbf[2];	\
		res = (res << 8) | lwbf[1];	\
		res = (res << 8) | lwbf[0];	\
		res;				\
	})

char *ft_pack(ftsf_entry *);
char *ft_packm(void);

char *mkheader(char *, size_t, u_int32_t, u_int32_t, u_int8_t);
char *mktrailer(char *, size_t);

void ft_dump(char *);
void ft_creatm(char *, const char *);

char *fwcf_unpack(int, size_t *);
char *fwcf_pack(char *, size_t, int, size_t *);
char *fwcf_packm(const char *, int, size_t *);

#endif
