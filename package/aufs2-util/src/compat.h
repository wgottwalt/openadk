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

#ifndef __compat_h__
#define __compat_h__

#ifndef AT_SYMLINK_NOFOLLOW
#define AT_SYMLINK_NOFOLLOW	0x100   /* Do not follow symbolic links.  */

#define __KERNEL__
#include <unistd.h>
#include <asm/unistd.h>
#define fstatat fstatat64
int fstatat(int dirfd, const char *path, struct stat *buf, int flags);
_syscall4(int, fstatat64, int, _dirfd, const char *, path, struct stat *, buf, int, flags);
#undef __KERNEL__
#endif

#endif /* __compat_h__ */
