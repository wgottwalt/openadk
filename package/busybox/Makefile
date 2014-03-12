# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		busybox
PKG_VERSION:=		1.21.1
PKG_RELEASE:=		5
PKG_MD5SUM:=		795394f83903b5eec6567d51eebb417e
PKG_DESCR:=		core utilities for embedded systems
PKG_SECTION:=		base
PKG_URL:=		http://www.busybox.net/
PKG_SITES:=		http://www.busybox.net/downloads/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_SUBPKGS:=		BUSYBOX UDHCPD
PKGSD_UDHCPD:=		uDHCPD meta package
PKGSC_UDHCPD:=		net

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BUSYBOX,busybox,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,UDHCPD,udhcpd,${PKG_VERSION}-${PKG_RELEASE},busybox,${PKGSD_UDHCPD},${PKGSC_UDHCPD}))

# This is how to extract the Config.in files from a _built_ busybox source tree:
#|for c in $(find build_viprinux_arm_glibc/w-busybox-1.18.1-4/busybox-1.18.1/ -name Config.in); do
#|	c=$(sed s,build_viprinux_arm_glibc/w-busybox-1.18.1-4/busybox-1.18.1/,, <<< $c)
#|	mkdir -p package/busybox/config_new/$(dirname $c)
#|	cp build_viprinux_arm_glibc/w-busybox-1.18.1-4/busybox-1.18.1/$c package/busybox/config_new/$c
#|done

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

BB_MAKE_FLAGS:=		V=1 IPKG_ARCH="${CPU_ARCH}" ARCH="${ARCH}" GCC_HONOUR_COPTS=s \
			HOSTCC="${CC_FOR_BUILD}" HOSTCFLAGS="$(CFLAGS_FOR_BUILD)" \
			CROSS_COMPILE="$(TARGET_CROSS)" EXTRA_LDFLAGS='-static-libgcc' \
			-C ${WRKBUILD} 

do-configure:
	# get all symbols from top level config
	grep BUSYBOX_ $(TOPDIR)/.config|sed -e 's/BUSYBOX_/CONFIG_/' > \
		${WRKBUILD}/.config
	# remove all disabled symbols
	for i in $$(grep "BUSYBOX_DISABLE" $(TOPDIR)/.config);do \
		test -s "$$i" || continue; \
		grep -v $${i#BUSYBOX_DISABLE} ${WRKBUILD}/.config > \
		${WRKBUILD}/.config.tmp; \
		cp ${WRKBUILD}/.config.tmp ${WRKBUILD}/.config; \
	done
	$(SED) 's;@IDIR@;${WRKINST};' ${WRKBUILD}/.config
	yes '' | $(MAKE) ${BB_MAKE_FLAGS} oldconfig $(MAKE_TRACE)

do-build:
	$(MAKE) ${BB_MAKE_FLAGS} busybox

do-install:
	$(MAKE) ${BB_MAKE_FLAGS} install $(MAKE_TRACE)
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

include ${TOPDIR}/mk/pkg-bottom.mk
