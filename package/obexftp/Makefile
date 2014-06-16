# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		obexftp
PKG_VERSION:=		0.23
PKG_RELEASE:=		4
PKG_MD5SUM:=		f20762061b68bc921e80be4aebc349eb
PKG_DESCR:=		bluetooth ftp application
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		openobex libobexftp
PKG_BUILDDEP:=		openobex
PKG_URL:=		http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=openobex/}
PKG_LIBNAME:=		libobexftp
PKG_OPTS:=		dev

PKG_SUBPKGS:=		OBEXFTP LIBOBEXFTP
PKGSC_LIBOBEXFTP:=	libs/net
PKGSD_LIBOBEXFTP:=	obex ftp library

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OBEXFTP,obexftp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBOBEXFTP,libobexftp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBOBEXFTP},${PKGSC_LIBOBEXFTP},${PKG_OPTS}))

ifeq ($(ADK_TARGET_USE_STATIC_LIBS),y)
XAKE_FLAGS+=		STATIC_CFLAGS=-all-static
endif

CONFIGURE_ENV+=		OPENOBEX_CFLAGS="-I${STAGING_TARGET_DIR}/usr/include" \
			OPENOBEX_LIBS="-L${STAGING_TARGET_DIR}/usr/lib \
			    -lopenobex -liconv"
CONFIGURE_ARGS+=	--disable-perl \
			--disable-ruby \
			--disable-tcl \
			--disable-python

obexftp-install:
	${INSTALL_DIR} ${IDIR_OBEXFTP}/usr/bin
	${CP} ${WRKINST}/usr/bin/obexftp{,d} ${IDIR_OBEXFTP}/usr/bin/

libobexftp-install:
	${INSTALL_DIR} ${IDIR_LIBOBEXFTP}/usr/lib
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_LIBOBEXFTP}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
