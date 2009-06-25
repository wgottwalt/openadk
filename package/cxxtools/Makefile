# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cxxtools
PKG_VERSION:=		1.4.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		16ce92a83beb925fa5138fc9a52d55af
PKG_DESCR:=		a collection of general-purpose C++ classes
PKG_SECTION:=		net
PKG_DEPENDS:=		libiconv
PKG_URL:=		http://www.tntnet.org
PKG_SITES:=		http://www.tntnet.org/download/

include ${TOPDIR}/mk/package.mk

ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
PKG_DEPENDS+=		uclibc++
else
PKG_DEPENDS+=		libstdcxx
endif

$(eval $(call PKG_template,CXXTOOLS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
TCXXFLAGS+=		-fno-builtin -nostdinc++ -I${STAGING_DIR}/usr/include/uClibc++
TLDFLAGS+=		-luClibc++ -liconv -lm -nodefaultlibs 
else
TLDFLAGS+=		-liconv -shared
endif

TCFLAGS+=		-fPIC
TCXXFLAGS+=		-fPIC
CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_lib_nsl_setsockopt=no
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

include ${TOPDIR}/mk/pkg-bottom.mk
