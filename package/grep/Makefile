# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		grep
PKG_VERSION:=		2.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		ac732142227d9fe9567d71301e127979
PKG_DESCR:=		global search for a regex and print out matched lines
PKG_SECTION:=		utils
PKG_DEPENDS:=		libpcre
PKG_BUILDDEP:=		pcre
PKG_URL:=		http://www.gnu.org/software/grep/
PKG_SITES:=		${MASTER_SITE_GNU:=grep/}
PKG_NOPARALLEL:=	1
PKG_BB:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GREP,grep,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

grep-install:
	$(INSTALL_DIR) $(IDIR_GREP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{e,f,}grep $(IDIR_GREP)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
