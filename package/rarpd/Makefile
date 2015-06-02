# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		rarpd
PKG_VERSION:=		1.1
PKG_RELEASE:=		11
PKG_HASH:=		936dc37422b658a8db98cd1d4d6b9fac63e13ac3fdc036e33dde996843baeba6
PKG_DESCR:=		reverse arp daemon
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libnet
PKG_BUILDDEP:=		libnet
PKG_SITES:=		http://distfiles.openadk.org/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RARPD,rarpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-libnet="${STAGING_TARGET_DIR}/usr" \
			--with-pcap="${STAGING_TARGET_DIR}/usr"
TARGET_CPPFLAGS+=	-DNEW_LIBNET_INTERFACE

rarpd-install:
	${INSTALL_DIR} ${IDIR_RARPD}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/rarpd ${IDIR_RARPD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
