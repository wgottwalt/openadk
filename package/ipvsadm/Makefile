# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ipvsadm
PKG_VERSION:=		1.26
PKG_RELEASE:=		2
PKG_MD5SUM:=		eac3ba3f62cd4dea2da353aeddd353a8
PKG_DESCR:=		IPVS admin utility
PKG_SECTION:=		net
PKG_DEPENDS:=		libpopt kmod-ip-vs
PKG_BUILDDEP:=		popt
PKG_URL:=		http://www.linuxvirtualserver.org/
PKG_SITES:=		http://www.linuxvirtualserver.org/software/kernel-2.6/
PKG_NOPARALLEL:=	1

include $(TOPDIR)/mk/package.mk

TARGET_CFLAGS+=		-I$(STAGING_TARGET_DIR)/usr/include/libnl3 -fPIC -DHAVE_NL=0
CONFIG_STYLE:=		manual
XAKE_FLAGS+=		HAVE_NL=0

$(eval $(call PKG_template,IPVSADM,ipvsadm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ipvsadm-install:
	$(INSTALL_DIR) $(IDIR_IPVSADM)/usr/sbin
	$(INSTALL_DIR) $(IDIR_IPVSADM)/usr/lib
	$(CP) $(WRKBUILD)/libipvs/libipvs.so \
		$(IDIR_IPVSADM)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/sbin/ipvsadm \
		$(IDIR_IPVSADM)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
