/* $MirOS: contrib/hosted/fwcf/minilzop.h,v 1.1 2007/03/09 21:10:29 tg Exp $ */

/*
 * This file is part of the FreeWRT project. FreeWRT is copyrighted
 * material, please see the LICENCE file in the top-level directory
 * or at http://www.freewrt.org/licence for details.
 */

#ifndef MINILZOP_H
#define MINILZOP_H

__BEGIN_DECLS
int minilzop(int ifd, int ofd, int compr_alg, int decompress);
/* TODO: use the two below for the “outer filesystem” as well */
void read_aszdata(int, char **, size_t *);
void write_aszdata(int, const char *, size_t);
__END_DECLS

#endif
