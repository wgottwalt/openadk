# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		coreutils
PKG_VERSION:=		8.22
PKG_RELEASE:=		3
PKG_MD5SUM:=		8fb0ae2267aa6e728958adc38f8163a2
PKG_DESCR:=		basic file, shell and text manipulation utilities (also provided by busybox)
PKG_SECTION:=		core
PKG_BUILDDEP:=		gmp autotool
PKG_URL:=		http://www.gnu.org/software/coreutils/
PKG_SITES:=		http://ftp.gnu.org/gnu/coreutils/
PKG_BB:=		1

include $(TOPDIR)/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
