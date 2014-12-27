# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pm-utils
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_HASH:=		8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b
PKG_DESCR:=		power management utilities
PKG_SECTION:=		sys/hw
PKG_URL:=		http://pm-utils.freedesktop.org/
PKG_SITES:=		http://pm-utils.freedesktop.org/releases/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_PM_UTILS:=	select BUSYBOX_FLOCK

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PM_UTILS,pm-utils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

pm-utils-install:
	$(INSTALL_DIR) $(IDIR_PM_UTILS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/pm-utils \
		 $(IDIR_PM_UTILS)/usr/lib
	$(INSTALL_DIR) $(IDIR_PM_UTILS)/usr/sbin
	$(CP) $(WRKINST)/usr/sbin/pm-* \
		$(IDIR_PM_UTILS)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
