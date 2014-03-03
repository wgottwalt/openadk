# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rng-tools
PKG_VERSION:=		2
PKG_RELEASE:=		2
PKG_MD5SUM:=		63d503191eabed630324c104cc024475
PKG_DESCR:=		Daemon to use hardware random number generators.
PKG_SECTION:=		crypto
PKG_URL:=		http://gkernel.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=gkernel/}

PKG_LIBC_DEPENDS:=	glibc musl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RNG_TOOLS,rng-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

rng-tools-install:
	$(INSTALL_DIR) $(IDIR_RNG_TOOLS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/rngd $(IDIR_RNG_TOOLS)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
