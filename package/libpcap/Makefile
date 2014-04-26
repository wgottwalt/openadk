# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libpcap
PKG_VERSION:=		1.5.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		33ba2f10f3a402cb5d34f5e2a904794a
PKG_DESCR:=		a low-level packet capture library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		m4-host flex-host bison-host libnl
PKG_URL:=		http://www.tcpdump.org/
PKG_SITES:=		http://www.tcpdump.org/release/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_LIBPCAP:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCAP,libpcap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_linux_vers=26
CONFIGURE_ARGS+=	--disable-yydebug \
			--with-build-cc=$(CC_FOR_BUILD) \
			--disable-dbus \
			--without-libnl \
			--with-pcap=linux
TARGET_CFLAGS+=		${TARGET_CPPFLAGS}
INSTALL_TARGET=		install install-shared
MAKE_FLAGS+=		STAGING_TARGET_DIR=$(STAGING_TARGET_DIR)
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

ifneq (${ADK_PACKAGE_LIBPCAP_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif
#XAKE_FLAGS+=		M4=m4

libpcap-install:
	${INSTALL_DIR} ${IDIR_LIBPCAP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcap.so* ${IDIR_LIBPCAP}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
