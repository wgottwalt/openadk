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
#ifndef BYTESWAP_H_
#define BYTESWAP_H_

#ifdef __linux__
#include_next <byteswap.h>
#else

#include <stdint.h>

static inline uint16_t bswap_16(uint16_t value)
{
    return ((value & 0xff00) >> 8) | ((value & 0xff) << 8);
}

static inline uint32_t bswap_32(uint32_t value)
{
    return ((value & 0xff000000) >> 24) |
           ((value & 0x00ff0000) >>  8) |
           ((value & 0x0000ff00) <<  8) |
           ((value & 0x000000ff) << 24);
}

static inline uint64_t bswap_64(uint64_t value)
{
    return ((value & 0xff00000000000000ull) >> 56) |
           ((value & 0x00ff000000000000ull) >> 40) |
           ((value & 0x0000ff0000000000ull) >> 24) |
           ((value & 0x000000ff00000000ull) >>  8) |
           ((value & 0x00000000ff000000ull) <<  8) |
           ((value & 0x0000000000ff0000ull) << 24) |
           ((value & 0x000000000000ff00ull) << 40) |
           ((value & 0x00000000000000ffull) << 56);
}

#endif

#endif /* BYTESWAP_H_ */
