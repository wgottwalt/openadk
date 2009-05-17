# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		obexftp
PKG_VERSION:=		0.20
PKG_RELEASE:=		2
PKG_MD5SUM:=		86224a7a1880c25e9ba0b8997a97d299
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=openobex/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OBEXFTP,obexftp,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		OPENOBEX_CFLAGS="-I${STAGING_DIR}/usr/include" \
			OPENOBEX_LIBS="-L${STAGING_DIR}/usr/lib \
			    -lopenobex -lbluetooth -liconv"
CONFIGURE_ARGS+=	--disable-perl \
			--disable-python
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_OBEXFTP}/usr/bin
	${INSTALL_DIR} ${IDIR_OBEXFTP}/usr/lib
	${CP} ${WRKINST}/usr/bin/* ${IDIR_OBEXFTP}/usr/bin/
	${CP} ${WRKINST}/usr/lib/* ${IDIR_OBEXFTP}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
