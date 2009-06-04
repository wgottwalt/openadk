# $MirOS: contrib/hosted/fwcf/mkfwcf/Makefile,v 1.14 2006/09/26 10:25:06 tg Exp $
# This file is part of the FreeWRT project. FreeWRT is copyrighted
# material, please see the LICENCE file in the top-level directory
# or at http://www.freewrt.org/licence for details.

PROG=		mkfwcf
SRCS=		${PROG}.c ${COMPRESSORS} sys_bsd.c
NOMAN=		yes
DPADD+=		${LIBZ}
LDADD+=		-lz
CLEANFILES+=	${.CURDIR}/test.out ${.CURDIR}/tesz.out ${.CURDIR}/tesL.out \
		${.CURDIR}/test.nil ${.CURDIR}/tesz.nil ${.CURDIR}/tesL.nil

test: ${PROG}
	./${PROG} -o ${.CURDIR}/test.out ${.CURDIR}/CVS
	./${PROG} -C 1 -o ${.CURDIR}/tesz.out ${.CURDIR}/CVS
	./${PROG} -C 16 -o ${.CURDIR}/tesL.out ${.CURDIR}/CVS
	./${PROG} -eo ${.CURDIR}/test.nil
	./${PROG} -eC 1 -o ${.CURDIR}/tesz.nil
	./${PROG} -eC 16 -o ${.CURDIR}/tesL.nil

.include <bsd.prog.mk>
