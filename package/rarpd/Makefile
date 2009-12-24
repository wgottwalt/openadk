# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rarpd
PKG_VERSION:=		1.1
PKG_RELEASE:=		11
PKG_BUILDDEP+=		libnet
PKG_MD5SUM:=		04e2ca849e758d0b88c8281775ec3b58
PKG_DESCR:=		Reverse ARP Daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		libnet
PKG_SITES:=		ftp://ftp.dementia.org/pub/net-tools/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RARPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-libnet="${STAGING_DIR}/usr" \
			--with-pcap="${STAGING_DIR}/usr"
TCFLAGS+=		-DNEW_LIBNET_INTERFACE
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_RARPD}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/rarpd ${IDIR_RARPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
