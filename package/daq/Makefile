# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		daq
PKG_VERSION:=		2.0.6
PKG_RELEASE:=		1
PKG_HASH:=		d41da5f7793e66044e6927dd868c0525e7ee4ec1a3515bf74ef9a30cd9273af0
PKG_DESCR:=		data acquisition library
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libpcap libdnet
PKG_BUILDDEP:=		libpcap libdnet
PKG_URL:=		http://www.snort.org
PKG_SITES:=		https://www.snort.org/downloads/snort/
PKG_OPTS:=		dev
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DAQ,daq,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-ipfw-module

daq-install:
	$(INSTALL_DIR) $(IDIR_DAQ)/usr/lib/daq
	$(CP) $(WRKINST)/usr/lib/daq/*.so \
		$(IDIR_DAQ)/usr/lib/daq
	$(CP) $(WRKINST)/usr/lib/*.so* \
		$(IDIR_DAQ)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
