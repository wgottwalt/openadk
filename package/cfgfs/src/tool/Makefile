# $MirOS: contrib/hosted/fwcf/tool/Makefile,v 1.5 2007/02/28 22:59:38 tg Exp $
# This file is part of the FreeWRT project. FreeWRT is copyrighted
# material, please see the LICENCE file in the top-level directory
# or at http://www.freewrt.org/licence for details.

PROG=		fwcf_tool
SRCS=		tool.c ${COMPRESSORS} sys_bsd.c
NOMAN=		yes
DPADD+=		${LIBZ}
LDADD+=		-lz
CLEANFILES+=	${.CURDIR}/test_c.out ${.CURDIR}/tesz_c.out ${.CURDIR}/tesL_c.out \
		${.CURDIR}/test_c.nil ${.CURDIR}/tesz_c.nil ${.CURDIR}/tesL_c.nil \
		${.CURDIR}/test_d.out ${.CURDIR}/tesz_d.out ${.CURDIR}/tesL_d.out \
		${.CURDIR}/test_d.nil ${.CURDIR}/tesz_d.nil ${.CURDIR}/tesL_d.nil \
		${.CURDIR}/test_r.out ${.CURDIR}/tesz_r.out ${.CURDIR}/tesL_r.out \
		${.CURDIR}/test_r.nil ${.CURDIR}/tesz_r.nil ${.CURDIR}/tesL_r.nil \
		${.CURDIR}/dtest_d.out ${.CURDIR}/dtesz_d.out ${.CURDIR}/dtesL_d.out \
		${.CURDIR}/dtest_d.nil ${.CURDIR}/dtesz_d.nil ${.CURDIR}/dtesL_d.nil \
		${.CURDIR}/test_D.out ${.CURDIR}/test_D.cz

test: ${PROG}
	./${PROG} -Mo ${.CURDIR}/test_c.out ${.CURDIR}/../mkfwcf/CVS
	./${PROG} -MC 1 -o ${.CURDIR}/tesz_c.out ${.CURDIR}/../mkfwcf/CVS
	./${PROG} -MC 0x10 -o ${.CURDIR}/tesL_c.out ${.CURDIR}/../mkfwcf/CVS
	./${PROG} -Meo ${.CURDIR}/test_c.nil
	./${PROG} -MeC 1 -o ${.CURDIR}/tesz_c.nil
	./${PROG} -MeC 16 -o ${.CURDIR}/tesL_c.nil
	./${PROG} -Ud <${.CURDIR}/test_c.out >${.CURDIR}/dtest_d.out
	./${PROG} -Ud <${.CURDIR}/tesz_c.out >${.CURDIR}/dtesz_d.out
	./${PROG} -Ud <${.CURDIR}/tesL_c.out >${.CURDIR}/dtesL_d.out
	./${PROG} -Ud <${.CURDIR}/test_c.nil >${.CURDIR}/dtest_d.nil
	./${PROG} -Ud <${.CURDIR}/tesz_c.nil >${.CURDIR}/dtesz_d.nil
	./${PROG} -Ud <${.CURDIR}/tesL_c.nil >${.CURDIR}/dtesL_d.nil
	./${PROG} -Ui ${.CURDIR}/test_c.out out.test
	./${PROG} -Ui ${.CURDIR}/tesz_c.out out.tesz
	./${PROG} -Ui ${.CURDIR}/tesL_c.out out.tesL
.ifndef notyet
	./${PROG} -Ri ${.CURDIR}/tesz_c.out -o ${.CURDIR}/test_r.out
	./${PROG} -Ri ${.CURDIR}/tesz_c.nil -o ${.CURDIR}/test_r.nil
	./${PROG} -Rci ${.CURDIR}/test_c.out -o ${.CURDIR}/tesz_r.out
	./${PROG} -Rci ${.CURDIR}/test_c.nil -o ${.CURDIR}/tesz_r.nil
	./${PROG} -RC 0x10 -i ${.CURDIR}/tesz_c.out -o ${.CURDIR}/tesL_r.out
	./${PROG} -RC 16 -i ${.CURDIR}/test_c.nil -o ${.CURDIR}/tesL_r.nil
.else
	./${PROG} -Ri ${.CURDIR}/test_c.out -o ${.CURDIR}/test_r.out
	./${PROG} -Ri ${.CURDIR}/test_c.nil -o ${.CURDIR}/test_r.nil
	./${PROG} -Rci ${.CURDIR}/tesz_c.out -o ${.CURDIR}/tesz_r.out
	./${PROG} -Rci ${.CURDIR}/tesz_c.nil -o ${.CURDIR}/tesz_r.nil
.endif
	./${PROG} -UD ${.CURDIR}/test_D.out <${.CURDIR}/tesL_c.out
	./${PROG} -McD ${.CURDIR}/test_D.out >${.CURDIR}/test_D.cz

.include <bsd.prog.mk>

clean cleandir: clean-local

clean-local:
	-rm -rf out.test out.tesz out.tesL
