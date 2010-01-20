# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		traceroute
PKG_VERSION:=		2.0.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		d400573042d41559fc3e5260275300d8
PKG_DESCR:=		Utility to trace the route of IP packets
PKG_SECTION:=		utils
PKG_DEPENDS:=
PKG_URL:=		http://traceroute.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=traceroute/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TRACEROUTE,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" \
			AR="${TARGET_CROSS}ar" \
			RANLIB="${TARGET_CROSS}ranlib" \
			LDFLAGS="-L${WRKSRC}/libsupp"
INSTALL_STYLE:=		auto

# please install all files and directories to the package dir
post-install:
	$(INSTALL_DIR) $(IDIR_TRACEROUTE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/local/bin/traceroute $(IDIR_TRACEROUTE)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
