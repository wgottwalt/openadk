# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		busybox
PKG_VERSION:=		1.15.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		495e320537f0772125f2db3c098e437c
PKG_DESCR:=		Core utilities for embedded Linux systems
PKG_SECTION:=		base
PKG_URL:=		http://www.busybox.net
PKG_SITES:=		http://www.busybox.net/downloads/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BUSYBOX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=	manual
BUILD_STYLE:=	manual
INSTALL_STYLE:=	manual

${TOPDIR}/.busyboxcfg: ${TOPDIR}/.config
	grep BUSYBOX_ $(TOPDIR)/.config|sed -e 's/BUSYBOX_/CONFIG_/' > \
		${TOPDIR}/.busyboxcfg

${WRKBUILD}/.config: ${TOPDIR}/.busyboxcfg
	cp $(TOPDIR)/.busyboxcfg ${WRKBUILD}/.config
	$(SED) 's;@IDIR@;${WRKINST};' ${WRKBUILD}/.config
	
do-configure: $(TOPDIR)/.busyboxcfg ${WRKBUILD}/.config
ifeq ($(ADK_NATIVE),y)
	yes '' | \
	$(MAKE) V=1 \
	    IPKG_ARCH="$(ARCH)" \
	    ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) oldconfig $(MAKE_TRACE)
else
	yes '' | \
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    EXTRA_CFLAGS="$(TARGET_CFLAGS)" IPKG_ARCH="$(ARCH)" \
	    ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) oldconfig $(MAKE_TRACE)
endif

do-build: $(TOPDIR)/.busyboxcfg ${WRKBUILD}/.config
ifeq ($(ADK_NATIVE),y)
	$(MAKE) V=1 \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) busybox
else
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) busybox
endif

do-install: $(TOPDIR)/.busyboxcfg ${WRKBUILD}/.config
ifeq ($(ADK_NATIVE),y)
	$(MAKE) V=1 \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) install $(MAKE_TRACE)
else
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) install $(MAKE_TRACE)
endif
	$(CP) $(WRKINST)/* $(IDIR_BUSYBOX)/
ifeq ($(ADK_DEBUG),y)
	${INSTALL_BIN} $(WRKBUILD)/busybox_unstripped \
		$(IDIR_BUSYBOX)/bin/busybox
endif

fake:	$(TOPDIR)/.busyboxcfg do-configure do-install

include ${TOPDIR}/mk/pkg-bottom.mk
