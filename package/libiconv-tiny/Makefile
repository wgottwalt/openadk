# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libiconv-tiny
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_HASH:=		1410d40697a5eda9de5e433edfbed540b66c3e1af7374b8507ab9c468b7d9012
PKG_DESCR:=		iconv stub and replacement
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.openwrt.org/
PKG_SITES:=		http://www.openadk.org/distfiles/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc-ng uclibc

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBICONV_TINY,libiconv-tiny,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBICONV_TINY,libiconv-tiny,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

libiconv-tiny-hostinstall:
	$(CP) $(WRKBUILD)/libiconv.a $(STAGING_HOST_DIR)/usr/lib
	$(CP) $(WRKBUILD)/include/* $(STAGING_HOST_DIR)/usr/include
	$(CP) $(WRKBUILD)/charmaps $(STAGING_HOST_DIR)/usr/include
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/share/aclocal
	$(CP) $(WRKBUILD)/m4/iconv.m4 \
		$(STAGING_HOST_DIR)/usr/share/aclocal

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
