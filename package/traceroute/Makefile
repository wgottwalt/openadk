# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		traceroute
PKG_VERSION:=		2.0.18
PKG_RELEASE:=		1
PKG_MD5SUM:=		b7254149b7f081cce07f4b9e065ba5ef
PKG_DESCR:=		Utility to trace the route of IP packets
PKG_SECTION:=		net
PKG_URL:=		http://traceroute.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=traceroute/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TRACEROUTE,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

MAKE_FLAGS+=		CC="${TARGET_CC}" \
			AR="${TARGET_CROSS}ar" \
			RANLIB="${TARGET_CROSS}ranlib" \
			CFLAGS="${TARGET_CFLAGS}" \
			LDFLAGS="${TARGET_LDFLAGS} -L${WRKSRC}/libsupp"

post-install:
	$(INSTALL_DIR) $(IDIR_TRACEROUTE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/traceroute \
		$(IDIR_TRACEROUTE)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
