# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pacemaker-mgmt
PKG_VERSION:=		2.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		be16a38588d1c518f53e64e7e48e1c90
PKG_DESCR:=		Pacemaker management daemon
PKG_SECTION:=		ha
PKG_BUILDDEP:=		pacemaker gnutls pam python2
PKG_URL:=		http://hg.clusterlabs.org/pacemaker/pygui/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_CFLINE_PACEMAKER_MGMTD:=	depends on ADK_TARGET_LIB_GLIBC || ADK_TARGET_LIB_EGLIBC

PKG_SUBPKGS:=		PACEMAKER_MGMTD
PKGSD_PACEMAKER_MGMTD:=	Management daemon for Pacemaker GUI

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PACEMAKER_MGMTD,pacemaker-mgmtd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(TOPDIR)/mk/python.mk

CONFIGURE_ENV+=		PYTHON=$(PYTHON)
CONFIGURE_ARGS+=	--with-initdir=/etc/init.d \
			--with-ocf-root=/usr/lib/ocf \
			--without-ais-support \
			--disable-fatal-warnings
TARGET_CFLAGS+=		-I$(STAGING_DIR)/usr/include/python2.7 \
			-I$(STAGING_DIR)/usr/include/pacemaker \
			-I$(STAGING_DIR)/usr/include/heartbeat

pacemaker-mgmtd-install:
	$(INSTALL_DIR) $(IDIR_PACEMAKER_MGMTD)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libhbmgmt*so* \
		$(IDIR_PACEMAKER_MGMTD)/usr/lib
	$(INSTALL_DIR) $(IDIR_PACEMAKER_MGMTD)/usr/lib/heartbeat
	$(INSTALL_BIN) $(WRKINST)/usr/lib/heartbeat/mgmtd \
		$(IDIR_PACEMAKER_MGMTD)/usr/lib/heartbeat
	
include ${TOPDIR}/mk/pkg-bottom.mk
