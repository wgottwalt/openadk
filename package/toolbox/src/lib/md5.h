/* $MirOS: src/kern/include/md5.h,v 1.4 2014/12/20 22:28:45 tg Exp $ */

#ifndef SYSKERN_MD5_H
#define SYSKERN_MD5_H

#ifdef __MirBSD__
#include <machine/types.h>
#endif

#define MD5_BLOCK_LENGTH		64
#define MD5_DIGEST_LENGTH		16
#define MD5_DIGEST_STRING_LENGTH	(MD5_DIGEST_LENGTH * 2 + 1)

typedef struct MD5Context {
	uint32_t state[4];
	uint64_t count;
	uint8_t buffer[MD5_BLOCK_LENGTH];
} MD5_CTX;

__BEGIN_DECLS

/* low-level functions */
void MD5Init(MD5_CTX *);
void MD5Update(MD5_CTX *, const uint8_t *, size_t)
    __attribute__((__bounded__(__string__, 2, 3)));
void MD5Pad(MD5_CTX *);
void MD5Final(uint8_t *, MD5_CTX *)
    __attribute__((__bounded__(__minbytes__, 1, MD5_DIGEST_LENGTH)));
void MD5Transform(uint32_t *, const uint8_t *)
    __attribute__((__bounded__(__minbytes__, 1, 16)))
    __attribute__((__bounded__(__minbytes__, 2, MD5_BLOCK_LENGTH)));

#if !defined(_KERNEL) && !defined(_STANDALONE)
/* high-level functions from helper.c */
char *MD5End(MD5_CTX *, char *)
    __attribute__((__bounded__(__minbytes__, 2, MD5_DIGEST_STRING_LENGTH)));
char *MD5File(const char *, char *)
    __attribute__((__bounded__(__minbytes__, 2, MD5_DIGEST_STRING_LENGTH)));
char *MD5FileChunk(const char *, char *, off_t, off_t)
    __attribute__((__bounded__(__minbytes__, 2, MD5_DIGEST_STRING_LENGTH)));
char *MD5Data(const uint8_t *, size_t, char *)
    __attribute__((__bounded__(__string__, 1, 2)))
    __attribute__((__bounded__(__minbytes__, 3, MD5_DIGEST_STRING_LENGTH)));
#endif

__END_DECLS

#endif
