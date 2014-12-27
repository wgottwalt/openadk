# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		coreutils
PKG_VERSION:=		8.22
PKG_RELEASE:=		3
PKG_HASH:=		5b3e94998152c017e6c75d56b9b994188eb71bf46d4038a642cb9141f6ff1212
PKG_DESCR:=		basic file, shell and text manipulation utilities
PKG_SECTION:=		base/apps
PKG_BUILDDEP:=		gmp
PKG_URL:=		http://www.gnu.org/software/coreutils/
PKG_SITES:=		http://ftp.gnu.org/gnu/coreutils/
PKG_BB:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,COREUTILS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-rpath

coreutils-install:
	$(INSTALL_DIR) $(IDIR_COREUTILS)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_COREUTILS)/usr/bin
	$(INSTALL_DIR) $(IDIR_COREUTILS)/usr/libexec
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_COREUTILS)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
