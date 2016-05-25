# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libxslt
PKG_VERSION:=		1.1.29
PKG_RELEASE:=		1
PKG_HASH:=		b5976e3857837e7617b29f2249ebb5eeac34e249208d31f1fbf7a6ba7a4090ce
PKG_DESCR:=		xslt library
PKG_SECTION:=		libs/data
PKG_DEPENDS:=		libxml2
PKG_BUILDDEP:=		libxslt-host libxml2
HOST_BUILDDEP:=		libxml2-host
PKG_NEEDS:=		c++
PKG_URL:=		http://xmlsoft.org/XSLT
PKG_SITES:=		http://xmlsoft.org/sources/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		LIBXSLT XSLTPROC
PKGSD_XSLTPROC:=	xslt processor utility
PKGSC_XSLTPROC:=	sys/misc

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBXSLT,libxslt,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXSLT,libxslt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,XSLTPROC,xsltproc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_XSLTPROC},${PKGSC_XSLTPROC}))

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

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
