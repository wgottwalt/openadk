# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mISDN
PKG_VERSION:=		1_1_9_2
PKG_RELEASE:=		1
PKG_MD5SUM:=		f9ec111fcc40c9ef48fc1822317998be
PKG_DESCR:=		mISDN is the new ISDN stack of the linux kernel 2.6, this is the out-of-tree 1.X version
PKG_SECTION:=		net/voip
PKG_URL:=		http://www.misdn.org
PKG_SITES:=		http://www.misdn.org/downloads/releases/
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/kernel-ver.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MISDN,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		LINUX=${LINUX_DIR} KVERS=${KERNEL_VERSION}
FAKE_FLAGS+=		INSTALL_PREFIX=${WRKINST}

#do-configure:
#	$(SED) 's/CONFIG_MISDN_AVM_FRITZ=y/CONFIG_MISDN_AVM_FRITZ=n/' ${WRKDIR}/add.config
#	$(SED) 's/CONFIG_MISDN_AVM_FRITZ=y/CONFIG_MISDN_AVM_FRITZ=n/' ${WRKDIR}/add.config

post-install:
	$(INSTALL_DIR) $(IDIR_MISDN)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/{mISDN,misdn-init} \
		$(IDIR_MISDN)/usr/sbin
	${INSTALL_DIR} ${IDIR_MISDN}/lib
	mv ${WRKINST}/lib/modules ${IDIR_MISDN}/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
