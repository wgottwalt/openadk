# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		grep
PKG_VERSION:=		2.24
PKG_RELEASE:=		1
PKG_HASH:=		f248beb9098c5aab94d2fdd03b5a21d705e5ba8a3ce4d8c9f607a670498eec14
PKG_DESCR:=		global search for a regex and print out matched lines
PKG_SECTION:=		base/apps
PKG_DEPENDS:=		libpcre
PKG_BUILDDEP:=		pcre
PKG_URL:=		http://www.gnu.org/software/grep/
PKG_SITES:=		${MASTER_SITE_GNU:=grep/}
PKG_NOPARALLEL:=	1
PKG_BB:=		1

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GREP,grep,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,GREP,grep,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

grep-install:
	$(INSTALL_DIR) $(IDIR_GREP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{e,f,}grep $(IDIR_GREP)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
