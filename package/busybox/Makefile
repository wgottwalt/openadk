# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		busybox
PKG_VERSION:=		1.15.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		495e320537f0772125f2db3c098e437c
PKG_DESCR:=		Core utilities for embedded Linux systems
PKG_SECTION:=		base
PKG_URL:=		http://www.busybox.net
PKG_SITES:=		http://www.busybox.net/downloads/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BUSYBOX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

do-configure:
	grep BUSYBOX_ $(TOPDIR)/.config|sed -e 's/BUSYBOX_/CONFIG_/' > \
		${WRKBUILD}/.config
	$(SED) 's@IDIR@${WRKINST}' ${WRKBUILD}/.config
ifeq ($(ADK_NATIVE),y)
	yes '' | \
	$(MAKE) V=1 \
	    IPKG_ARCH="$(ARCH)" \
	    ARCH="$(ARCH)" -C $(WRKBUILD) oldconfig
else
	yes '' | \
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    EXTRA_CFLAGS="$(TARGET_CFLAGS)" IPKG_ARCH="$(ARCH)" \
	    ARCH="$(ARCH)" -C $(WRKBUILD) oldconfig
endif

do-build:
ifeq ($(ADK_NATIVE),y)
	$(MAKE) V=1 \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" -C $(WRKBUILD) busybox
else
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" -C $(WRKBUILD) busybox
endif

do-install: ${TOPDIR}/.config
ifeq ($(ADK_NATIVE),y)
	$(MAKE) V=1 \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" -C $(WRKBUILD) install
else
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" -C $(WRKBUILD) install
endif
ifeq ($(DEBUG),1)
	${INSTALL_BIN} $(WRKBUILD)/busybox_unstripped \
		$(IDIR_BUSYBOX)/bin/busybox
endif
	$(CP) $(WRKINST)/* $(IDIR_BUSYBOX)/

include ${TOPDIR}/mk/pkg-bottom.mk
