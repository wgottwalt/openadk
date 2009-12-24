# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libsigc++
PKG_VERSION:=		2.2.4.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		a79b2fe9de69b40e020617c7a652d704
PKG_DESCR:=		Callback framework for C++
PKG_SECTION:=		libs
PKG_URL:=		http://libsigc.sourceforge.net
PKG_SITES:=		${MASTER_SITE_GNOME:=libsigc++/2.2/}
PKG_CXX:=		LIBSIGCXX

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSIGCXX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_COMPILE_LIBSIGCXX_WITH_UCLIBCXX),y)
CONFIGURE_ENV+=		CXXFLAGS="-fno-builtin -fno-rtti -nostdinc++ \
			-I${STAGING_DIR}/usr/include/uClibc++" \
			LIBS="-nodefaultlibs -luClibc++ -lc -lm -lgcc"
endif

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

ifeq (${ADK_COMPILE_LIBSIGCXX_WITH_UCLIBCXX},y)
# add workaround because libtool tries to link libstdc++
post-configure:
	${SED} 's#postdeps="-lstdc.*#postdeps=""#' \
		${WRKBUILD}/libtool
endif

post-install:
	${INSTALL_DIR} ${IDIR_LIBSIGCXX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libsigc-2.0.so.* ${IDIR_LIBSIGCXX}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
