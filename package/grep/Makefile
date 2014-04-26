# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		grep
PKG_VERSION:=		2.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		d4a3f03849d1e17ce56ab76aa5a24cab
PKG_DESCR:=		global search for a regex and print out matched lines
PKG_SECTION:=		utils
PKG_DEPENDS:=		libpcre libiconv
PKG_BUILDDEP:=		pcre
PKG_URL:=		http://www.gnu.org/software/grep/
PKG_SITES:=		ftp://ftp.gnu.org/gnu/grep/
PKG_NOPARALLEL:=	1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GREP,grep,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-liconv

grep-install:
	$(INSTALL_DIR) $(IDIR_GREP)/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{e,f,}grep $(IDIR_GREP)/bin

include ${TOPDIR}/mk/pkg-bottom.mk
