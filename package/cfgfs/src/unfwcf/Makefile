# $MirOS: contrib/hosted/fwcf/unfwcf/Makefile,v 1.14 2006/09/26 10:25:06 tg Exp $
#-
# This file is part of the FreeWRT project. FreeWRT is copyrighted
# material, please see the LICENCE file in the top-level directory
# or at http://www.freewrt.org/licence for details.

PROG=		unfwcf
SRCS=		${PROG}.c ${COMPRESSORS} sys_bsd.c
NOMAN=		yes
DPADD+=		${LIBZ}
LDADD+=		-lz
CLEANFILES+=	${.CURDIR}/test.out ${.CURDIR}/tesz.out \
		${.CURDIR}/test.nil ${.CURDIR}/tesz.nil

test: ${PROG}
	./${PROG} -d <${.CURDIR}/../mkfwcf/test.out >${.CURDIR}/test.out
	./${PROG} -d <${.CURDIR}/../mkfwcf/tesz.out >${.CURDIR}/tesz.out
	./${PROG} -d <${.CURDIR}/../mkfwcf/test.nil >${.CURDIR}/test.nil
	./${PROG} -d <${.CURDIR}/../mkfwcf/tesz.nil >${.CURDIR}/tesz.nil
	./${PROG} -i ${.CURDIR}/../mkfwcf/test.out out.test
	./${PROG} -i ${.CURDIR}/../mkfwcf/tesz.out out.tesz

.include <bsd.prog.mk>

clean cleandir: clean-local

clean-local:
	-rm -rf out.test out.tesz
