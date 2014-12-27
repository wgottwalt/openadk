# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lirc
PKG_VERSION:=		0.9.1-pre2
PKG_RELEASE:=		1
PKG_HASH:=		2ecad376ca491e71d75d0de61e9d0a6b3c1e57962b446f8ff4a43ea4f611fe20
PKG_DESCR:=		decode and send infra-red signals
PKG_SECTION:=		sys/hw
PKG_URL:=		http://www.lirc.org/
PKG_SITES:=		http://www.lirc.org/software/snapshots/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIRC,lirc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-driver=none

post-extract:
	find $(WRKSRC)/ -name *.rej -delete

lirc-install:
	$(INSTALL_DIR) $(IDIR_LIRC)/usr/lib
	$(CP) $(WRKINST)/usr/lib/liblirc_client.so* \
		$(IDIR_LIRC)/usr/lib
	$(INSTALL_DIR) $(IDIR_LIRC)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/lircd \
		$(IDIR_LIRC)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/lircmd \
		$(IDIR_LIRC)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
