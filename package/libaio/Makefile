# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libaio
PKG_VERSION:=		0.3.109
PKG_RELEASE:=		2
PKG_MD5SUM:=		435a5b16ca6198eaf01155263d855756
PKG_DESCR:=		asynchronous I/O library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.kernel.org
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBAIO,libaio,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=         	prefix='${WRKINST}/usr'

libaio-install:
	$(INSTALL_DIR) $(IDIR_LIBAIO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libaio*so* \
		$(IDIR_LIBAIO)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
