# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libosip2
PKG_VERSION:=		3.3.0
PKG_RELEASE:=		2
PKG_HASH:=		d45e28deaa596b2d7457edefe916b4761adbd53d543180f4ff30f9c310a5f821
PKG_DESCR:=		session initiation protocol implementation
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.gnu.org/software/osip
PKG_SITES:=		${MASTER_SITE_GNU:=osip/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOSIP2,libosip2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-trace \
			--enable-pthread \
			--enable-semaphore \
			--enable-ntimer

libosip2-install:
	${INSTALL_DIR} ${IDIR_LIBOSIP2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libosip{,parser}2.so* \
		${IDIR_LIBOSIP2}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
