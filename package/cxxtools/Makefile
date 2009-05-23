# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cxxtools
PKG_VERSION:=		1.4.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		16ce92a83beb925fa5138fc9a52d55af
MASTER_SITES:=		http://www.tntnet.org/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CXXTOOLS,cxxtools,${PKG_VERSION}-${PKG_RELEASE}))

ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
TCXXFLAGS+=		-fno-builtin -nostdinc++ -I${STAGING_DIR}/usr/include/uClibc++
TLDFLAGS+=		-luClibc++ -liconv -lm -nodefaultlibs 
DEPENDS=		"libgcc, uclibc++, libiconv"
else
TLDFLAGS+=		-liconv -shared
DEPENDS=		"libgcc, libiconv, libstdcxx"
endif

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-libiconv-prefix='${STAGING_DIR}/usr'
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto confprog

ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
# add workaround because libtool tries to link libstdc++
post-configure:
	${SED} 's#postdeps="-lstdc.*#postdeps=""#' \
		${WRKBUILD}/libtool
endif

post-install:
	${INSTALL_DIR} ${IDIR_CXXTOOLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcxxtools.so.* ${IDIR_CXXTOOLS}/usr/lib/
	echo Depends: ${DEPENDS} >>${IDIR_CXXTOOLS}/CONTROL/control

include ${TOPDIR}/mk/pkg-bottom.mk
