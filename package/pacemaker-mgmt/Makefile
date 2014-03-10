# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pacemaker-mgmt
PKG_VERSION:=		2.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		be16a38588d1c518f53e64e7e48e1c90
PKG_DESCR:=		Pacemaker management daemon
PKG_SECTION:=		ha
PKG_BUILDDEP:=		swig-host pacemaker gnutls pam python2
PKG_URL:=		http://hg.clusterlabs.org/pacemaker/pygui/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_LIBC_DEPENDS:=	glibc musl
PKG_ARCH_DEPENDS:=      x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PACEMAKER_MGMT,pacemaker-mgmt,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(TOPDIR)/mk/python.mk

CONFIGURE_ENV+=		PYTHON=$(PYTHON)
CONFIGURE_ARGS+=	--with-initdir=/etc/init.d \
			--with-ocf-root=/usr/lib/ocf \
			--without-ais-support \
			--disable-fatal-warnings
TARGET_CFLAGS+=		-I$(STAGING_TARGET_DIR)/usr/include/python2.7 \
			-I$(STAGING_TARGET_DIR)/usr/include/pacemaker \
			-I$(STAGING_TARGET_DIR)/usr/include/heartbeat

pacemaker-mgmt-install:
	$(INSTALL_DIR) $(IDIR_PACEMAKER_MGMT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libhbmgmt*so* \
		$(IDIR_PACEMAKER_MGMT)/usr/lib
	$(INSTALL_DIR) $(IDIR_PACEMAKER_MGMT)/usr/lib/heartbeat
	$(INSTALL_BIN) $(WRKINST)/usr/lib/heartbeat/mgmtd \
		$(IDIR_PACEMAKER_MGMT)/usr/lib/heartbeat
	
include ${TOPDIR}/mk/pkg-bottom.mk
