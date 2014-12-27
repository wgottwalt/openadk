# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		esmtp
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_HASH:=		a0d26931bf731f97514da266d079d8bc7d73c65b3499ed080576ab606b21c0ce
PKG_DESCR:=		relay-only mail transfer agent
PKG_SECTION:=		net/mail
PKG_DEPENDS:=		libesmtp flex
PKG_BUILDDEP:=		libesmtp flex
PKG_URL:=		http://esmtp.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=esmtp/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ESMTP,esmtp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

esmtp-install:
	$(INSTALL_DIR) $(IDIR_ESMTP)/usr/{bin,sbin}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/esmtp $(IDIR_ESMTP)/usr/bin
	$(CP) $(WRKINST)/usr/bin/{mailq,newaliases} $(IDIR_ESMTP)/usr/bin/
	$(CP) $(WRKINST)/usr/sbin/sendmail $(IDIR_ESMTP)/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
