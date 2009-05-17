# $MirOS: contrib/hosted/fwcf/GNUmakefile,v 1.8 2007/03/09 23:09:34 tg Exp $
#-
# This file is part of the FreeWRT project. FreeWRT is copyrighted
# material, please see the LICENCE file in the top-level directory
# or at http://www.freewrt.org/licence for details.

SRCS+=		tool.c
SRCS+=		sys_linux.c
SRCS+=		replace.c
SRCS+=		compress.c
#SRCS+=		fts_debg.c
SRCS+=		cpr_get.c
SRCS+=		cpr_list.c
SRCS+=		cpr_lsth.c
SRCS+=		ft_creat.c
SRCS+=		ft_pack.c
SRCS+=		ft_packm.c
SRCS+=		fts_subs.c
SRCS+=		header.c
SRCS+=		minilzop.c
SRCS+=		unwraps.c
SRCS+=		wraps.c

# the compressor
SRCS+=		c_lzo1x1.c
CPPFLAGS+=	-Ibundled

OBJS=		${SRCS:.c=.o}

# build for the target
CPPFLAGS+=	-DSMALL -D__USE_GNU

# missing in uClibc
SRCS+=		fts.c
CPPFLAGS+=	-I.

all: fwcf.helper.out

fwcf.helper.out: ${OBJS}
	${CC} -o $@ ${OBJS} ${LDFLAGS}
