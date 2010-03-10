# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		grep
PKG_VERSION:=		2.5.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		92258031d98d4f12dfc6a6d24057e672
PKG_DESCR:=		global search for a regular expression and print out matched lines
PKG_SECTION:=		text
PKG_URL:=		http://www.gnu.org/software/grep/
PKG_SITES:=		ftp://ftp.gnu.org/gnu/grep/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GREP,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_GREP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/grep \
		$(IDIR_GREP)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
