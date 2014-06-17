# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

# always use tab spaces as separator, no spaces
PKG_NAME:=		esmtp
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		79a9c1f9023d53f35bb82bf446150a72
PKG_DESCR:=		relay-only Mail Transfer Agent (MTA)
PKG_SECTION:=		net/mail
PKG_DEPENDS:=		libesmtp openssl flex
PKG_BUILDDEP:=		libesmtp openssl flex
PKG_URL:=		http://esmtp.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=esmtp/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ESMTP,esmtp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

esmtp-install:
	$(INSTALL_DIR) $(IDIR_ESMTP)/usr/{bin,sbin}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/esmtp $(IDIR_ESMTP)/usr/bin
	$(CP) $(WRKINST)/usr/bin/{mailq,newaliases} $(IDIR_ESMTP)/usr/bin/
	$(CP) $(WRKINST)/usr/sbin/sendmail $(IDIR_ESMTP)/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
