# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libxslt
PKG_VERSION:=		1.1.24
PKG_RELEASE:=		1
PKG_MD5SUM:=		e83ec5d27fc4c10c6f612879bea9a153
PKG_DESCR:=		XSLT Library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libxml2
PKG_BUILDDEP:=		libxml2
PKG_URL:=		http://xmlsoft.org/XSLT
PKG_SITES:=		http://xmlsoft.org/sources/
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		LIBXSLT LIBXSLT_DEV XSLTPROC
PKGSD_LIBXSLT_DEV:=	XSLT headers
PKGSC_LIBXSLT_DEV:=	devel
PKGSD_XSLTPROC:=	XSLT processor utility
PKGSC_XSLTPROC:=	misc

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBXSLT,libxslt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXSLT_DEV,libxslt-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXSLT_DEV},${PKGSC_LIBXSLT_DEV}))
$(eval $(call PKG_template,XSLTPROC,xsltproc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_XSLTPROC},${PKGSC_XSLTPROC}))

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

libxslt-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXSLT_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXSLT_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXSLT_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/xslt-config \
		${IDIR_LIBXSLT_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
