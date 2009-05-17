/* $MirOS: contrib/hosted/fwcf/defs.h,v 1.7 2007/03/13 18:28:20 tg Exp $ */

/*
 * This file is part of the FreeWRT project. FreeWRT is copyrighted
 * material, please see the LICENCE file in the top-level directory
 * or at http://www.freewrt.org/licence for details.
 */

#ifndef DEFS_H
#define DEFS_H

#define DEF_FLASHBLOCK	65536		/* size of a flash block */
#define DEF_FLASHPART	131072		/* size of the flash partition */

#define FWCF_VER	0x01		/* major version of spec used */

#ifndef __RCSID
#define __RCSID(x)	static const char __rcsid[] __attribute__((used)) = (x)
#endif

#ifndef BSD
#define uint8_t		u_int8_t
#define uint16_t	u_int16_t
#define uint32_t	u_int32_t
#define uint64_t	u_int64_t
#endif

#ifndef __dead
#define __dead		__attribute__((noreturn))
#endif

#include "replace.h"  			/* strlcpy/strlcat replacement for glibc */

#endif
