# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		capi4k-utils
PKG_VERSION:=		2005-07-18
PKG_RELEASE:=		1
PKG_HASH:=		b162d726a31310fc29e7c0a25a4f82a590457f6a95c1b1168bcd72b6497b5746
PKG_DESCR:=		capi4linux utils
PKG_SECTION:=		net/voip
PKG_SITES:=		ftp://ftp.in-berlin.de/pub/capi4linux/

PKG_CFLINE_CAPI4K_UTILS:=depends on ADK_BROKEN

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CAPI4K_UTILS,capi4k-utils,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		PPPVERSIONS=2.4.5

do-configure:
	echo "CONFIG_KERNELDIR='$(LINUX_DIR)'" >$(WRKDIST)/.config
	echo "CONFIG_BINDIR='/usr/bin'" >>$(WRKDIST)/.config
	echo "CONFIG_SBINDIR='/usr/sbin'" >>$(WRKDIST)/.config
	echo "CONFIG_MANDIR='/usr/man'" >>$(WRKDIST)/.config
	echo "CONFIG_RCAPID=y" >>$(WRKDIST)/.config
	echo "CONFIG_PPPDCAPIPLUGIN=y" >>$(WRKDIST)/.config
	(cd $(WRKDIST); \
		cp Makefile Makefile.tmp; \
		$(MAKE_ENV) $(MAKE) $(MAKE_FLAGS) -f Makefile.tmp subconfig; \
		rm -f Makefile.tmp; \
	)

capi4k-utils-install:
	$(INSTALL_DIR) $(IDIR_CAPI4K_UTILS)/usr/{bin,lib/pppd/2.4.5}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/capiinfo \
		$(IDIR_CAPI4K_UTILS)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libcapi20.so* \
		$(IDIR_CAPI4K_UTILS)/usr/lib
	$(INSTALL_DATA) $(WRKINST)/usr/lib/pppd/2.4.5/*.so \
		$(IDIR_CAPI4K_UTILS)/usr/lib/pppd/2.4.5

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
