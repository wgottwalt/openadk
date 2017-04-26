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
#ifndef ENDIAN_H_
#define ENDIAN_H_

#ifdef __linux__
#include_next <endian.h>
#elif __APPLE__

#include <machine/endian.h>

#ifndef __DARWIN_BYTE_ORDER
#error "No __DARWIN_BYTE_ORDER defined"
#endif

#define __BYTE_ORDER		__DARWIN_BYTE_ORDER
#define __LITTLE_ENDIAN		__DARWIN_LITTLE_ENDIAN
#define __BIG_ENDIAN		__DARWIN_BIG_ENDIAN

#else
#error "No byteswap.h found"
#endif

#endif /* ENDIAN_H_ */
