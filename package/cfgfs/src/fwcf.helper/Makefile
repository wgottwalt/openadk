# $MirOS: contrib/hosted/fwcf/fwcf.helper/Makefile,v 1.9 2007/03/13 18:14:31 tg Exp $
# This file is part of the FreeWRT project. FreeWRT is copyrighted
# material, please see the LICENCE file in the top-level directory
# or at http://www.freewrt.org/licence for details.

PROG=		fwcf.helper
SRCS=		tool.c sys_bsd.c
CFLAGS_tool.o+=	-DSMALL
_CFLADD+=	tool.o
NOMAN=		Yes
SRCS+=		compress.c
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
CLEANFILES+=	${.CURDIR}/test.out ${.CURDIR}/test.nil

LIB=		# don't need, thanks

.ifdef COMPRESSOR_ZLIB
SRCS+=		c_zlib.c
DPADD+=		${LIBZ}
LDADD+=		-lz
.else
SRCS+=		c_lzo1x1.c
.endif

test: ${PROG}
	./${PROG} -M ${.CURDIR}/../mkfwcf/CVS >${.CURDIR}/test.out
	./${PROG} -Me >${.CURDIR}/test.nil
#	./${PROG} -U out.test <${.CURDIR}/../mkfwcf/test.out
.ifdef COMPRESSOR_ZLIB
	./${PROG} -U out.tesz <${.CURDIR}/../mkfwcf/tesz.out
.else
	./${PROG} -U out.tesL <${.CURDIR}/../mkfwcf/tesL.out
.endif

.include <bsd.prog.mk>

clean cleandir: clean-local

clean-local:
	-rm -rf out.test out.tesz out.tesL
