# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cxxtools
PKG_VERSION:=		1.4.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		16ce92a83beb925fa5138fc9a52d55af
PKG_DESCR:=		a collection of general-purpose C++ classes
PKG_SECTION:=		libs
PKG_DEPENDS:=		libiconv
PKG_BUILDDEP+=		libiconv
PKG_URL:=		http://www.tntnet.org
PKG_SITES:=		http://www.tntnet.org/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CXXTOOLS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
TCXXFLAGS+=		-fno-builtin -nostdinc++ \
			-I${STAGING_DIR}/usr/include/uClibc++ -Wl,-E
TLDFLAGS+=		-luClibc++ -liconv -lm -nodefaultlibs -shared
else
TLDFLAGS+=		-liconv -shared
endif

TCFLAGS+=		-fPIC
TCXXFLAGS+=		-fPIC
CONFIGURE_ARGS+=	--with-libiconv-prefix='${STAGING_DIR}/usr'

post-install:
	${INSTALL_DIR} ${IDIR_CXXTOOLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcxxtools.so* ${IDIR_CXXTOOLS}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
