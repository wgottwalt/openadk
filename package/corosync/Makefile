# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		corosync
PKG_VERSION:=		2.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		4689279c36b1417e122a23c6818017dd
PKG_DESCR:=		Cluster Engine	
PKG_SECTION:=		ha
PKG_BUILDDEP:=		libqb nss
PKG_DEPENDS:=		cluster-glue libqb nss
PKG_URL:=		http://www.corosync.org/
PKG_SITES:=		http://corosync.org/download/

PKG_CFLINE_COROSYNC:=	select ADK_KERNEL_IP_MULTICAST
PKG_LIBC_DEPENDS:=	glibc musl
PKG_ARCH_DEPENDS:=      x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,COROSYNC,corosync,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
TARGET_CPPFLAGS+=	-I$(STAGING_DIR)/usr/include/nss \
			-I$(STAGING_DIR)/usr/include/nspr
TARGET_LDFLAGS+=	-lssl3 -lsmime3 -lnss3 -lnssutil3
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
	$(INSTALL_DIR) $(IDIR_COROSYNC)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_COROSYNC)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
