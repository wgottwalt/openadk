# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libpcap
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		06046e0e81efc60566daf1cc96c77d46
PKG_DESCR:=		a low-level packet capture library
PKG_SECTION:=		libs
PKG_URL:=		http://www.tcpdump.org/
PKG_SITES:=		http://www.tcpdump.org/release/

PKG_SUBPKGS:=		LIBPCAP LIBPCAP_DEV
PKGSD_LIBPCAP_DEV:=	headers for a low-level packet capture library
PKGSC_LIBPCAP_DEV:=	devel

PKG_FLAVOURS_LIBPCAP:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCAP,libpcap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBPCAP_DEV,libpcap-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBPCAP_DEV},${PKGSC_LIBPCAP_DEV}))

CONFIGURE_ENV+=		ac_cv_linux_vers=26
CONFIGURE_ARGS+=	--disable-yydebug \
			--with-build-cc=$(CC_FOR_BUILD) \
			--with-pcap=linux
TARGET_CFLAGS+=		${TARGET_CPPFLAGS}
INSTALL_TARGET=		install install-shared
MAKE_FLAGS+=		STAGING_TARGET_DIR=$(STAGING_TARGET_DIR)

ifneq (${ADK_PACKAGE_LIBPCAP_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif
XAKE_FLAGS+=		M4=m4

libpcap-install:
	${INSTALL_DIR} ${IDIR_LIBPCAP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcap.so* ${IDIR_LIBPCAP}/usr/lib

libpcap-dev-install:
	${INSTALL_DIR} ${IDIR_LIBPCAP_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBPCAP_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
