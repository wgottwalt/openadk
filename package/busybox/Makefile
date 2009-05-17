# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		busybox
PKG_VERSION:=		1.13.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		6f86b4aa466f4b492c9468ba9500976a
MASTER_SITES:=		http://www.busybox.net/downloads/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BUSYBOX,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

#rebuild:
#	@rm $(WRKBUILD)/.configure_done

do-configure:
	grep BUSYBOX_ $(TOPDIR)/.config|sed -e 's/BUSYBOX_/CONFIG_/' > \
		${WRKBUILD}/.config
	$(SED) 's@IDIR@${WRKINST}' ${WRKBUILD}/.config
	yes '' | \
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    EXTRA_CFLAGS="$(TARGET_CFLAGS)" IPKG_ARCH="$(ARCH)" \
	    ARCH="$(ARCH)" -C $(WRKBUILD) oldconfig

do-build:
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" -C $(WRKBUILD)

do-install: ${TOPDIR}/.config
	$(MAKE) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
	    IPKG_ARCH="$(ARCH)" ARCH="$(ARCH)" -C $(WRKBUILD) install
ifeq ($(DEBUG),1)
	${INSTALL_BIN} $(WRKBUILD)/busybox_unstripped \
		$(IDIR_BUSYBOX)/bin/busybox
endif
	$(CP) $(WRKINST)/* $(IDIR_BUSYBOX)/
	$(INSTALL_DIR) $(IDIR_BUSYBOX)/etc/init.d/
	$(INSTALL_BIN) ./files/syslog.init \
		$(IDIR_BUSYBOX)/etc/init.d/syslog
	$(INSTALL_BIN) ./files/network.init \
		$(IDIR_BUSYBOX)/etc/init.d/network
	$(INSTALL_BIN) ./files/crond.init \
		$(IDIR_BUSYBOX)/etc/init.d/crond
	${INSTALL_BIN} files/inetd.init \
		${IDIR_BUSYBOX}/etc/init.d/inetd

include ${TOPDIR}/mk/pkg-bottom.mk
