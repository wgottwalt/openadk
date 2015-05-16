# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		busybox
PKG_VERSION:=		1.23.2
PKG_RELEASE:=		1
PKG_HASH:=		05a6f9e21aad8c098e388ae77de7b2361941afa7157ef74216703395b14e319a
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
			CROSS_COMPILE="$(TARGET_CROSS)" \
			SKIP_STRIP=y

do-configure:
	# get all symbols from top level config
	grep "^BUSYBOX_\|# BUSYBOX" $(ADK_TOPDIR)/.config|grep -v BUSYBOX_DISABLE|sed -e 's/BUSYBOX_/CONFIG_/' > \
		${WRKBUILD}/.config
	# convert all disabled symbols
	for i in $$(grep ^BUSYBOX_DISABLE $(ADK_TOPDIR)/.config);do \
		sym=$${i#BUSYBOX_DISABLE_}; \
		symbol=$$(echo $$sym|sed -e "s#=y##"); \
		printf "# CONFIG_$${symbol} is not set\n" >> ${WRKBUILD}/.config; \
	done
ifeq ($(ADK_TARGET_UCLINUX),y)
	echo 'CONFIG_NOMMU=y' >> ${WRKBUILD}/.config
endif
	$(SED) 's;@IDIR@;${WRKINST};' ${WRKBUILD}/.config

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
