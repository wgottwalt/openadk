# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		slang
PKG_VERSION:=		2.3.0
PKG_RELEASE:=		1
PKG_HASH:=		f95224060f45e0d8212a5039b339afa5f1a94a1bb0298e796104e5b12e926129
PKG_DESCR:=		multi-platform programmer\'s library designed to allow a developer to create robust software
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.jedsoft.org/slang/
PKG_SITES:=		http://www.jedsoft.org/releases/slang/
PKG_NOPARALLEL:=	1

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SLANG,slang,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--without-pcre \
			--without-onig \
			--without-png \
			--without-z

slang-install:
	$(INSTALL_DIR) $(IDIR_SLANG)/usr/{bin,lib/slang/v2/modules}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/slsh \
		$(IDIR_SLANG)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libslang.so* \
		$(IDIR_SLANG)/usr/lib
	$(INSTALL_DATA) $(WRKINST)/usr/lib/slang/v2/modules/*.so \
		$(IDIR_SLANG)/usr/lib/slang/v2/modules
	$(INSTALL_DIR) $(IDIR_SLANG)/usr/share/slsh/{cmaps,rline}
	$(INSTALL_DATA) $(WRKINST)/usr/share/slsh/*.sl \
		$(IDIR_SLANG)/usr/share/slsh
	$(INSTALL_DATA) $(WRKINST)/usr/share/slsh/cmaps/*.map \
		$(IDIR_SLANG)/usr/share/slsh/cmaps
	$(INSTALL_DATA) $(WRKINST)/usr/share/slsh/rline/*.sl \
		$(IDIR_SLANG)/usr/share/slsh/rline

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
