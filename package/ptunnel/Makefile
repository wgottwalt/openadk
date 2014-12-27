# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ptunnel
PKG_VERSION:=		0.61
PKG_RELEASE:=		2
PKG_HASH:=		9f19f05f772cd7caba52a0f0adf9fd93d5fab8f6c50fc7fada0505294bd0aac3
PKG_DESCR:=		tunnel tcp connections over icmp packets
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libpcap libpthread
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://www.cti.ecp.fr/~beauxir5/ptunnel/
PKG_SITES:=		http://www.cti.ecp.fr/~beauxir5/ptunnel/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PTUNNEL,ptunnel,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		BUILD_CC="${TARGET_CC}" \
			ac_cv_linux_vers=2 \
			td_cv_buggygetaddrinfo="no"

ptunnel-install:
	${INSTALL_DIR} ${IDIR_PTUNNEL}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ptunnel ${IDIR_PTUNNEL}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
