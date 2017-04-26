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
#ifndef OS_COMPAT_H_
#define OS_COMPAT_H_

#ifdef __APPLE__

/* off_t is already 64 bits wide, even on i386 */
#define O_LARGEFILE 0
#define lseek64(fd, offset, whence) lseek((fd), (offset), (whence))

#endif /* __APPLE__ */

#endif /* OS_COMPAT_H_ */
