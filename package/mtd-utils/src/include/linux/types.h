/*
 * Copyright (c) Bernhard Walle <bernhard@bwalle.de>, 2012
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
 * the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 * Comatibility with BSD-like userland.
 */
#ifndef LINUX_TYPES_H_
#define LINUX_TYPES_H_

#ifdef __linux__
#include_next <linux/types.h>
#else

#include <stdint.h>     /* get uint8_t etc. */
#include <sys/types.h>  /* get u_long etc. */

/* This types are provided to Linux userland */

typedef uint8_t		__u8;
typedef uint16_t	__u16;
typedef uint32_t	__u32;
typedef uint64_t	__u64;

typedef int8_t		__s8;
typedef int16_t		__s16;
typedef int32_t		__s32;
typedef int64_t		__s64;

/*
 * The type itself has no endianess. It's only used for code checkers
 * but we don't need to run that checkers on non-Linux OSes
 */
typedef __u16       __le16;
typedef __u16       __be16;
typedef __u32       __le32;
typedef __u32       __be32;
typedef __u64       __le64;
typedef __u64       __be64;

/* from /usr/include/asm-generic/posix_types.h on Linux */
typedef long        __kernel_off_t;
typedef long long   __kernel_loff_t;

typedef long long   loff_t;
typedef long long   off64_t;

#endif

#endif /* LINUX_TYPES_H_ */
