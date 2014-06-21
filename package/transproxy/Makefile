# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		transproxy
PKG_VERSION:=		1.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		02cc1160a9db9c49a40491f890083044
PKG_DESCR:=		transparent http proxy
PKG_SECTION:=		net/proxy
PKG_DEPENDS:=		iptables
PKG_URL:=		http://sourceforge.net/projects/transproxy/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=transproxy/1.6/}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TRANSPROXY,transproxy,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

transproxy-install:
	$(INSTALL_DIR) $(IDIR_TRANSPROXY)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/tproxy* \
		$(IDIR_TRANSPROXY)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
