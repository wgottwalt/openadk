#ifndef __endian_compat_h
#define __endian_compat_h

#if defined(__linux__) || defined(__CYGWIN__)
#include <byteswap.h>
#include_next <endian.h>
#elif defined(__APPLE__)
#include <machine/endian.h>
#include <machine/byte_order.h>
#elif defined(__FreeBSD__)
#include <sys/endian.h>
#elif defined(__OpenBSD__)
#include <sys/types.h>
#else
#include <machine/endian.h>
#endif

#ifndef __BYTE_ORDER
#define __BYTE_ORDER BYTE_ORDER
#endif
#ifndef __BIG_ENDIAN
#define __BIG_ENDIAN BIG_ENDIAN
#endif
#ifndef __LITTLE_ENDIAN
#define __LITTLE_ENDIAN LITTLE_ENDIAN
#endif

#endif
