# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tcpdump
PKG_VERSION:=		4.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		d0dd58bbd6cd36795e05c6f1f74420b0
PKG_DESCR:=		A tool for network monitoring and data acquisition
PKG_SECTION:=		net
PKG_DEPENDS:=		libpcap
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://www.tcpdump.org/
PKG_SITES:=		http://www.tcpdump.org/release/

PKG_FLAVOURS:=		WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TCPDUMP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		BUILD_CC="${TARGET_CC}" HOSTCC=${HOSTCC} \
			ac_cv_linux_vers=2 \
			td_cv_buggygetaddrinfo="no"
CONFIGURE_ARGS+=	--without-crypto
ifneq (${ADK_PACKAGE_TCPDUMP_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif
XAKE_FLAGS+=		CCOPT="${TARGET_CFLAGS}" \
			INCLS="-I. -I${STAGING_TARGET_DIR}/usr/include"

post-install:
	${INSTALL_DIR} ${IDIR_TCPDUMP}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tcpdump ${IDIR_TCPDUMP}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
