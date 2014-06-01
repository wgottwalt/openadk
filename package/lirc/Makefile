# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lirc
PKG_VERSION:=		0.9.1-pre2
PKG_RELEASE:=		1
PKG_MD5SUM:=		234ea7d786a83e6f4f7a507a5719d62b
PKG_DESCR:=		decode and send infra-red signals
PKG_SECTION:=		sys/misc
PKG_BUILDDEP:=		autotool
PKG_URL:=		http://www.lirc.org/
PKG_SITES:=		http://www.lirc.org/software/snapshots/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
