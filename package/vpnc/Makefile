# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		vpnc
PKG_VERSION:=		0.5.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		4378f9551d5b077e1770bbe09995afb3
PKG_DESCR:=		client for cisco3000 vpn concentrator
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libgcrypt libgpg-error
PKG_BUILDDEP:=		libgcrypt libgpg-error
PKG_URL:=		http://www.unix-ag.uni-kl.de/~massar/vpnc/
PKG_SITES:=		http://www.unix-ag.uni-kl.de/~massar/vpnc/
PKG_CFLINE_VPNC:=	select ADK_KERNEL_TUN m

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VPNC,vpnc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TARGET_CPPFLAGS+=	-D_GNU_SOURCE
XAKE_FLAGS+=		CC="${TARGET_CC}" \
			OFLAGS="${TARGET_CFLAGS}" \
			OS="Linux" \
			PREFIX=/usr

vpnc-install:
	${CP} ${WRKINST}/* ${IDIR_VPNC}/
	${CP} files/vpnc-route ${IDIR_VPNC}/etc/vpnc/
	${CP} files/vpnc-script ${IDIR_VPNC}/etc/vpnc/
	${CP} files/vpnc.conf ${IDIR_VPNC}/etc/vpnc/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
