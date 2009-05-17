# $MirOS: contrib/hosted/fwcf/Makefile.inc,v 1.10 2007/05/08 21:52:53 tg Exp $
#-
# This file is part of the FreeWRT project. FreeWRT is copyrighted
# material, please see the LICENCE file in the top-level directory
# or at http://www.freewrt.org/licence for details.

__CRAZY=		Yes
MKC_DEBG=		cpp

UNAME_S!=		uname -s

.ifndef LIB
.  if exists(${.CURDIR}/../lib/${__objdir})
DPADD+=			${.CURDIR}/../lib/${__objdir}/libfwcf.a
LDADD+=			-L${.CURDIR}/../lib/${__objdir} -lfwcf
.  else
DPADD+=			${.CURDIR}/../lib/libfwcf.a
LDADD+=			-L${.CURDIR}/../lib -lfwcf
.  endif
.endif

CPPFLAGS+=		-I${.CURDIR}/..
.PATH: ${.CURDIR}/..

test: .NOTMAIN all

COMPRESSORS+=		c_null.c
COMPRESSORS+=		c_zlib.c
CPPFLAGS+=		-DZCONST=const

COMPRESSORS+=		c_lzo1x1.c
MKDEP+=			-I${.CURDIR}/../bundled
CFLAGS_c_lzo1x1.o+=	-I${.CURDIR}/../bundled -Wno-undef
_CFLADD+=		c_lzo1x1.o

.if make(test)
CFLAGS_sys_bsd.o+=	-DRND_DISABLE
_CFLADD+=		sys_bsd.o
.endif

.if ${UNAME_S} == "OpenBSD"
.  for _i in ${_CFLADD}
CFLAGS+=		${CFLAGS_${_i}}
.  endfor
.endif
