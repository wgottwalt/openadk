# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		crda
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		5226f65aebacf94baaf820f8b4e06df4
PKG_DESCR:=		Central Regulatory Domain Agent for wireless networks
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		libnl
PKG_BUILDDEP:=		libnl
PKG_URL:=		http://wireless.kernel.org/en/developers/Regulatory
PKG_SITES:=		http://linuxwireless.org/download/crda/
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_FLAVOURS_CRDA:=		WITH_UDEV
PKGFD_WITH_UDEV:=	install shipped UDEV rules
PKGFS_WITH_UDEV:=	udev
PKGFB_WITH_UDEV:=	udev

PKG_CHOICES_CRDA:=	WITH_OPENSSL WITH_GCRYPT
PKGCD_WITH_OPENSSL:=	SSL support via OpenSSL library
PKGCD_WITH_GCRYPT:=	SSL support via GCRYPT library
PKGCB_WITH_OPENSSL:=	openssl
PKGCB_WITH_GCRYPT:=	libgcrypt
PKGCS_WITH_OPENSSL:=	libopenssl
PKGCS_WITH_GCRYPT:=	libgcrypt

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CRDA,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
ALL_TARGET:=		all_noverify

ifneq (${ADK_PACKAGE_CRDA_WITH_OPENSSL},)
XAKE_FLAGS+=		USE_OPENSSL=1
endif

post-install:
	$(INSTALL_DIR) $(IDIR_CRDA)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/{crda,regdbdump} \
		$(IDIR_CRDA)/usr/sbin
ifneq (${ADK_PACKAGE_CRDA_WITH_UDEV},)
	$(INSTALL_DIR) $(IDIR_CRDA)/lib/udev/rules.d
	${INSTALL_DATA} ${WRKINST}/lib/udev/rules.d/85-regulatory.rules \
		${IDIR_CRDA}/lib/udev/rules.d
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
