# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		oprofile
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		4e407093ac06200185d5a5e6437d7242
PKG_DESCR:=		system-wide profiles
PKG_SECTION:=		debug
PKG_DEPENDS:=		libpopt kmod-oprofile libbfd libstdcxx
PKG_BUILDDEP:=		popt binutils
PKG_URL:=		http://oprofile.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=oprofile/}

PKG_ARCH_DEPENDS:=	!cris

PKG_CFLINE_OPROFILE:=	select BUSYBOX_EXPR

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPROFILE,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-kernel-support

post-install:
	$(INSTALL_DIR) $(IDIR_OPROFILE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/opcontrol $(IDIR_OPROFILE)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ophelp $(IDIR_OPROFILE)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/opreport $(IDIR_OPROFILE)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/oprofiled $(IDIR_OPROFILE)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
