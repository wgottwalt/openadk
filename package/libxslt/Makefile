# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libxslt
PKG_VERSION:=		1.1.28
PKG_RELEASE:=		2
PKG_MD5SUM:=		9667bf6f9310b957254fdcf6596600b7
PKG_DESCR:=		XSLT Library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libxml2 libstdcxx
PKG_BUILDDEP:=		autotool libxml2
HOST_BUILDDEP:=		libxml2-host
PKG_URL:=		http://xmlsoft.org/XSLT
PKG_SITES:=		http://xmlsoft.org/sources/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		LIBXSLT XSLTPROC
PKGSD_XSLTPROC:=	XSLT processor utility
PKGSC_XSLTPROC:=	misc

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBXSLT,libxslt,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXSLT,libxslt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,XSLTPROC,xsltproc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_XSLTPROC},${PKGSC_XSLTPROC}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--without-python \
			--without-crypto \
			--with-libxml-prefix="${STAGING_HOST_DIR}/usr" \
			--with-libxml-include-prefix="${STAGING_HOST_DIR}/usr/include/libxml2" \
			--with-libxml-libs-prefix="${STAGING_HOST_DIR}/usr/lib"
AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-libxml-prefix="${STAGING_TARGET_DIR}/usr" \
			--with-libxml-include-prefix="${STAGING_TARGET_DIR}/usr/include/libxml2" \
			--with-libxml-libs-prefix="${STAGING_TARGET_DIR}/usr/lib" \
			--without-python \
			--without-crypto \
			--without-debug \
			--without-mem-debug \
			--without-debugger

xsltproc-install:
	${INSTALL_DIR} ${IDIR_XSLTPROC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/xsltproc ${IDIR_XSLTPROC}/usr/bin

libxslt-install:
	${INSTALL_DIR} ${IDIR_LIBXSLT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxslt.so* ${IDIR_LIBXSLT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libexslt.so* ${IDIR_LIBXSLT}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
