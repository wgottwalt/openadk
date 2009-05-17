# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gmediaserver
PKG_VERSION:=		0.13.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		c422de386331e2a1a859d45f6fa270a3
MASTER_SITES:=		http://savannah.nongnu.org/download/gmediaserver/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GMEDIASERVER,gmediaserver,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		LIBS=" -lixml -lthreadutil -lupnp -lz" \
			am_cv_func_iconv=no
CONFIGURE_ARGS+=	--with-id3lib="${STAGING_DIR}/usr" \
			--with-libupnp="${STAGING_DIR}/usr"
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

ifeq ($(ADK_TARGET_LIB_UCLIBCXX),y)
CONFIGURE_ENV+=		LIBS=" -lixml -lthreadutil -lupnp -luClibc++ -lz"
endif

post-install:
	${INSTALL_DIR} ${IDIR_GMEDIASERVER}/etc/init.d
	${INSTALL_BIN} ./files/gmediaserver.init \
		${IDIR_GMEDIASERVER}/etc/init.d/gmediaserver
	${INSTALL_DIR} ${IDIR_GMEDIASERVER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gmediaserver ${IDIR_GMEDIASERVER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
