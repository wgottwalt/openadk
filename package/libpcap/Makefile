# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libpcap
PKG_VERSION:=		1.8.1
PKG_RELEASE:=		1
PKG_HASH:=		673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e48dcd9c6f0c83541e
PKG_DESCR:=		low-level packet capture library
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.tcpdump.org/
PKG_SITES:=		http://www.tcpdump.org/release/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_LIBPCAP:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCAP,libpcap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ARGS+=	--disable-yydebug \
			--disable-dbus \
			--without-libnl \
			--with-pcap=linux
INSTALL_TARGET=		install install-shared

ifneq (${ADK_PACKAGE_LIBPCAP_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

libpcap-install:
	${INSTALL_DIR} ${IDIR_LIBPCAP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcap.so* ${IDIR_LIBPCAP}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
