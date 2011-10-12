# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		Pacemaker-Python-GUI
PKG_VERSION:=		2.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		22379f78409cec9df10c25983783ef6c
PKG_DESCR:=		Pacemaker GUI
PKG_SECTION:=		ha
PKG_BUILDDEP:=		pacemaker gnutls pam
PKG_URL:=		http://hg.clusterlabs.org/pacemaker/pygui/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SUBPKGS:=		PACEMAKER_PYTHON_GUI PACEMAKER_MGMTD
PKGSD_PACEMAKER_MGMTD:=	Management daemon for Pacemaker GUI

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PACEMAKER_PYTHON_GUI,pacemaker-python-gui,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PACEMAKER_MGMTD,pacemaker-mgmtd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-initdir=/etc/init.d \
			--with-ocf-root=/usr/lib/ocf \
			--disable-fatal-warnings
TARGET_CFLAGS+=		-I$(STAGING_DIR)/usr/include/python2.7 \
			-I$(STAGING_DIR)/usr/include/pacemaker \
			-I$(STAGING_DIR)/usr/include/heartbeat

pacemaker-python-gui-install:
	$(INSTALL_DIR) $(IDIR_PACEMAKER_PYTHON_GUI)/usr/bin
	$(INSTALL_DIR) $(IDIR_PACEMAKER_PYTHON_GUI)/usr/lib/heartbeat-gui
	$(CP) $(WRKINST)/usr/lib/heartbeat-gui/* \
		$(IDIR_PACEMAKER_PYTHON_GUI)/usr/lib/heartbeat-gui
	$(INSTALL_BIN) $(WRKINST)/usr/bin/hb_gui \
		$(IDIR_PACEMAKER_PYTHON_GUI)/usr/bin

pacemaker-mgmtd-install:
	$(INSTALL_DIR) $(IDIR_PACEMAKER_MGMTD)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libhbmgmt*so* \
		$(IDIR_PACEMAKER_MGMTD)/usr/lib
	$(INSTALL_DIR) $(IDIR_PACEMAKER_MGMTD)/usr/lib/heartbeat
	$(INSTALL_BIN) $(WRKINST)/usr/lib/heartbeat/mgmtd \
		$(IDIR_PACEMAKER_MGMTD)/usr/lib/heartbeat
	
include ${TOPDIR}/mk/pkg-bottom.mk
