# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		totd
PKG_VERSION:=		1.5.1
PKG_RELEASE:=		1
PKG_HASH:=		1a09ef6dcf382beea3546eec3138eadfbaeec198a6f921c96e8937e91a1e06fa
PKG_DESCR:=		trick or treat daemon
PKG_SECTION:=		net/dns
PKG_URL:=		http://www.dillema.net/software/totd.html
PKG_SITES:=		http://www.dillema.net/software/totd/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TOTD,totd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

totd-install:
	$(INSTALL_DIR) $(IDIR_TOTD)/{usr/sbin,etc}
	${INSTALL_DATA} ./files/totd.conf ${IDIR_TOTD}/etc
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/totd $(IDIR_TOTD)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
