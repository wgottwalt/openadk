# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		busybox
PKG_VERSION:=		1.22.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		337d1a15ab1cb1d4ed423168b1eb7d7e
PKG_DESCR:=		core utilities for embedded systems
PKG_SECTION:=		base/apps
PKG_BUILDDEP:=		bzip2-host
PKG_URL:=		http://www.busybox.net/
PKG_SITES:=		http://www.busybox.net/downloads/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BUSYBOX,busybox,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

BB_MAKE_FLAGS:=		V=1 \
			ARCH="${ADK_TARGET_ARCH}" \
			IPKG_ARCH="${ADK_TARGET_CPU_ARCH}" \
			HOSTCC="${CC_FOR_BUILD}" \
			HOSTCFLAGS="$(CFLAGS_FOR_BUILD)" \
			CROSS_COMPILE="$(TARGET_CROSS)"

do-configure:
	# get all symbols from top level config
	grep BUSYBOX_ $(ADK_TOPDIR)/.config|sed -e 's/BUSYBOX_/CONFIG_/' > \
		${WRKBUILD}/.config
	# remove all disabled symbols
	for i in $$(grep "BUSYBOX_DISABLE" $(ADK_TOPDIR)/.config);do \
		test -s "$$i" || continue; \
		grep -v $${i#BUSYBOX_DISABLE} ${WRKBUILD}/.config > \
		${WRKBUILD}/.config.tmp; \
		cp ${WRKBUILD}/.config.tmp ${WRKBUILD}/.config; \
	done
	$(SED) 's;@IDIR@;${WRKINST};' ${WRKBUILD}/.config
	yes '' | PATH='$(HOST_PATH)' $(MAKE) ${BB_MAKE_FLAGS} -C ${WRKBUILD} oldconfig $(MAKE_TRACE)

do-build:
	PATH='$(HOST_PATH)' $(MAKE) ${BB_MAKE_FLAGS} -C ${WRKBUILD} busybox

do-install:
	PATH='$(HOST_PATH)' $(MAKE) ${BB_MAKE_FLAGS} -C ${WRKBUILD} install $(MAKE_TRACE)
	$(CP) $(WRKINST)/* $(IDIR_BUSYBOX)/
ifeq ($(BUSYBOX_IFUPDOWN),y)
	$(INSTALL_DIR) $(IDIR_BUSYBOX)/etc/init.d
	$(INSTALL_BIN) ./files/network $(IDIR_BUSYBOX)/etc/init.d
endif
ifeq ($(ADK_DEBUG),y)
	${INSTALL_BIN} $(WRKBUILD)/busybox_unstripped \
		$(IDIR_BUSYBOX)/bin/busybox
endif
ifneq ($(strip ${ADK_PACKAGE_CFGFS}),)
	cd ${IDIR_BUSYBOX}/sbin && rm -f halt poweroff reboot
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
