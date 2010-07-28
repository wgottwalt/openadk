# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		busybox
PKG_VERSION:=		1.17.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		c7fe7533b7fc4018b0b49a05ee0ee601
PKG_DESCR:=		Core utilities for embedded systems
PKG_SECTION:=		base
PKG_URL:=		http://www.busybox.net/
PKG_SITES:=		http://www.busybox.net/downloads/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_DESCR_UDHCPD:=	uDHCPD meta package
PKG_SECTION_UDHCPD:=	net

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BUSYBOX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,UDHCPD,udhcpd,${PKG_VERSION}-${PKG_RELEASE},busybox,${PKG_DESCR_UDHCPD},${PKG_SECTION_UDHCPD}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_UDHCPD}+=	udhcpd-install

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

${TOPDIR}/.busyboxcfg: ${TOPDIR}/.config
	grep BUSYBOX_ $(TOPDIR)/.config|sed -e 's/BUSYBOX_/CONFIG_/' > \
		${TOPDIR}/.busyboxcfg

${WRKBUILD}/.config: ${TOPDIR}/.busyboxcfg
	cp $(TOPDIR)/.busyboxcfg ${WRKBUILD}/.config
	$(SED) 's;@IDIR@;${WRKINST};' ${WRKBUILD}/.config

do-configure: ${WRKBUILD}/.config
ifeq ($(ADK_NATIVE),y)
	yes '' | \
	$(MAKE) V=1 \
	    IPKG_ARCH="$(CPU_ARCH)" \
	    ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) oldconfig $(MAKE_TRACE)
else
	yes '' | \
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    EXTRA_CFLAGS="$(TARGET_CFLAGS)" IPKG_ARCH="$(CPU_ARCH)" \
	    ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) oldconfig $(MAKE_TRACE)
endif

do-build: do-configure
ifeq ($(ADK_NATIVE),y)
	$(MAKE) V=1 \
	    IPKG_ARCH="$(CPU_ARCH)" ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) busybox
else
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    IPKG_ARCH="$(CPU_ARCH)" ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) busybox
endif

do-install: ${WRKBUILD}/.config ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
ifeq ($(ADK_NATIVE),y)
	$(MAKE) V=1 \
	    IPKG_ARCH="$(CPU_ARCH)" ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) install $(MAKE_TRACE)
else
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    IPKG_ARCH="$(CPU_ARCH)" ARCH="$(ARCH)" HOSTCC="$(HOSTCC)" -C $(WRKBUILD) install $(MAKE_TRACE)
endif
	$(CP) $(WRKINST)/* $(IDIR_BUSYBOX)/
ifeq ($(ADK_DEBUG),y)
	${INSTALL_BIN} $(WRKBUILD)/busybox_unstripped \
		$(IDIR_BUSYBOX)/bin/busybox
endif
ifneq ($(strip ${ADK_PACKAGE_CFGFS}),)
	cd ${IDIR_BUSYBOX}/sbin && rm -f halt poweroff reboot
endif

udhcpd-install:
	${INSTALL_DIR} ${IDIR_UDHCPD}/etc/
	${INSTALL_DATA} ./files/udhcpd.conf ${IDIR_UDHCPD}/etc/

rebuild:
	@if [ -f ${TOPDIR}/.rebuild.${PKG_NAME} ];then \
		rm ${WRKBUILD}/.build_done; \
		rm ${TOPDIR}/.rebuild.${PKG_NAME}; \
	fi

fake: rebuild

include ${TOPDIR}/mk/pkg-bottom.mk
