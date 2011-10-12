# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		corosync
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		66231146af210637393748add091021d
PKG_DESCR:=		Cluster Engine	
PKG_SECTION:=		ha
PKG_DEPENDS:=		cluster-glue
PKG_URL:=		http://www.corosync.org/
PKG_SITES:=		ftp://ftp:downloads@ftp.corosync.org/downloads/corosync-1.4.1/

PKG_CFLINE_COROSYNC:=	select ADK_KERNEL_IP_MULTICAST

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,COROSYNC,corosync,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-nss
CONFIGURE_ENV+=		ac_cv_func_fnmatch_works=yes

corosync-install:
	$(INSTALL_DIR) $(IDIR_COROSYNC)/etc/corosync
	$(CP) ./files/corosync.conf $(IDIR_COROSYNC)/etc/corosync
	$(INSTALL_DIR) $(IDIR_COROSYNC)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib*.so* \
		$(IDIR_COROSYNC)/usr/lib
	$(INSTALL_DIR) $(IDIR_COROSYNC)/usr/sbin
	$(CP) $(WRKINST)/usr/sbin/* \
		$(IDIR_COROSYNC)/usr/sbin
	$(INSTALL_DIR) $(IDIR_COROSYNC)/usr/libexec
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_COROSYNC)/usr/libexec

include ${TOPDIR}/mk/pkg-bottom.mk
