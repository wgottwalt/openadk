/* $MirOS: contrib/hosted/fwcf/defs.h,v 1.7 2007/03/13 18:28:20 tg Exp $ */

/*
 * This file is part of the FreeWRT project. FreeWRT is copyrighted
 * material, please see the LICENCE file in the top-level directory
 * or at http://www.freewrt.org/licence for details.
 */

#ifndef DEFS_H
#define DEFS_H

#define DEF_FLASHBLOCK	65536		/* size of a flash block */
#define DEF_FLASHPART	4194304		/* max size of the partition */

#define FWCF_VER	0x01		/* major version of spec used */

#ifndef __RCSID
#define __RCSID(x)	static const char __rcsid[] __attribute__((used)) = (x)
#endif

#ifndef __dead
#define __dead		__attribute__((noreturn))
#endif

#include "replace.h"  			/* strlcpy/strlcat replacement for glibc */

#endif
