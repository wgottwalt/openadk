# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		coreutils
PKG_VERSION:=		8.22
PKG_RELEASE:=		2
PKG_MD5SUM:=		8fb0ae2267aa6e728958adc38f8163a2
PKG_DESCR:=		basic file, shell and text manipulation utilities
PKG_SECTION:=		base
PKG_BUILDDEP:=		gmp autotool
PKG_URL:=		http://www.gnu.org/software/coreutils/
PKG_SITES:=		http://ftp.gnu.org/gnu/coreutils/

PKG_SUBPKGS:=		TSORT SHA256SUM TOUCH
PKGSD_TSORT:=		topological sort utility
PKGSC_TSORT:=		misc
PKGSD_SHA256SUM:=	SHA1 256 bit checksum utility
PKGSC_SHA256SUM:=	misc
PKGSD_TOUCH:=		touch utility
PKGSC_TOUCH:=		misc

include $(TOPDIR)/mk/package.mk

#$(eval $(call PKG_template,COREUTILS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,TSORT,tsort,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_TSORT},${PKGSC_TSORT}))
$(eval $(call PKG_template,TOUCH,touch,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_TOUCH},${PKGSC_TOUCH}))
$(eval $(call PKG_template,SHA256SUM,sha256sum,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_SHA256SUM},${PKGSC_SHA256SUM}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-rpath

touch-install:
	$(INSTALL_DIR) $(IDIR_TOUCH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/touch \
		$(IDIR_TOUCH)/usr/bin

tsort-install:
	$(INSTALL_DIR) $(IDIR_TSORT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/tsort \
		$(IDIR_TSORT)/usr/bin

sha256sum-install:
	$(INSTALL_DIR) $(IDIR_SHA256SUM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/sha256sum \
		$(IDIR_SHA256SUM)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
