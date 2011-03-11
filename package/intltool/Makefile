# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		intltool
PKG_VERSION:=		0.41.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		d6c91bf06681919ccfdf3624035b75dc
PKG_DESCR:=		Internationalization Tool Collection
PKG_SECTION:=		misc
PKG_SITES:=		http://edge.launchpad.net/intltool/trunk/0.41.1/+download/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,INTLTOOL,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		PERL="/usr/bin/perl"

post-install:
	$(INSTALL_DIR) $(IDIR_INTLTOOL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/intltool* \
		$(IDIR_INTLTOOL)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
