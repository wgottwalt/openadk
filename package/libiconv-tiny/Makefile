# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libiconv-tiny
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		7211794e2fa1df4123c5cc9f9226a5bb
PKG_DESCR:=		iconv stub and replacement
PKG_SECTION:=		libs
PKG_URL:=		http://www.openwrt.org/
PKG_SITES:=		http://www.openadk.org/distfiles/
PKG_OPTS:=		dev devonly

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBICONV_TINY,libiconv-tiny,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBICONV_TINY,libiconv-tiny,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual

libiconv-tiny-hostinstall:
	$(CP) $(WRKBUILD)/libiconv.a $(STAGING_HOST_DIR)/usr/lib
	$(CP) $(WRKBUILD)/include/* $(STAGING_HOST_DIR)/usr/include
	$(CP) $(WRKBUILD)/charmaps $(STAGING_HOST_DIR)/usr/include
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/share/aclocal
	$(CP) $(WRKBUILD)/m4/iconv.m4 \
		$(STAGING_HOST_DIR)/usr/share/aclocal

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
