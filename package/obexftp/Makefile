# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		obexftp
PKG_VERSION:=		0.23
PKG_RELEASE:=		1
PKG_MD5SUM:=		f20762061b68bc921e80be4aebc349eb
PKG_DESCR:=		bluetooth ftp application
PKG_SECTION:=		bluetooth
PKG_DEPENDS:=		openobex libiconv
PKG_URL:=		http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=openobex/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OBEXFTP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		OPENOBEX_CFLAGS="-I${STAGING_DIR}/usr/include" \
			OPENOBEX_LIBS="-L${STAGING_DIR}/usr/lib \
			    -lopenobex -lbluetooth -liconv"
CONFIGURE_ARGS+=	--disable-perl \
			--disable-ruby \
			--disable-tcl \
			--disable-python
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_OBEXFTP}/usr/bin ${IDIR_OBEXFTP}/usr/lib
	${CP} ${WRKINST}/usr/bin/* ${IDIR_OBEXFTP}/usr/bin/
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_OBEXFTP}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
