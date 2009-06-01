# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vpnc
PKG_VERSION:=		0.4.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		604807e7dd90fce00a4e2344ee29c76d
PKG_DESCR:=		client for cisco3000 VPN Concentrator.
PKG_SECTION:=		net
PKG_DEPENDS:=		libgcrypt libgpg-error kmod-tun
PKG_URL:=		http://www.unix-ag.uni-kl.de/~massar/vpnc/
PKG_SITES:=		http://www.unix-ag.uni-kl.de/~massar/vpnc/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VPNC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
XAKE_FLAGS+=		CC="${TARGET_CC}" \
			OFLAGS="${TARGET_CFLAGS}" \
			OS="Linux" \
			STAGING_DIR=${STAGING_DIR} \
			PREFIX=/usr
INSTALL_STYLE:=		auto

post-install:
	${CP} ${WRKINST}/* ${IDIR_VPNC}/
	${CP} files/vpnc-route ${IDIR_VPNC}/etc/vpnc/
	${CP} files/vpnc-script ${IDIR_VPNC}/etc/vpnc/
	${CP} files/vpnc.conf ${IDIR_VPNC}/etc/vpnc/

include ${TOPDIR}/mk/pkg-bottom.mk
