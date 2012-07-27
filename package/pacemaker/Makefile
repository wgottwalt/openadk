# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pacemaker
PKG_VERSION:=		1.1.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		bfe2127d31e5244d0106a5c290fd0dc2
PKG_DESCR:=		scalable High-Availability cluster resource manager
PKG_SECTION:=		ha
PKG_BUILDDEP:=		resource-agents cluster-glue pam gnutls corosync
PKG_DEPENDS:=		python2 python2-readline python2-bzip2 cluster-glue
PKG_DEPENDS+=		bash resource-agents pam libgnutls glib libxslt libxml2
PKG_URL:=		http://www.clusterlabs.org/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_CFLINE_PACEMAKER:=	depends on ADK_TARGET_LIB_GLIBC || ADK_TARGET_LIB_EGLIBC
PKG_ARCH_DEPENDS:=	x86

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PACEMAKER,pacemaker,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

CONFIGURE_ARGS+=	--disable-fatal-warnings
CONFIGURE_ENV+=		ac_cv_path_HELP2MAN=''
CFLAGS_FOR_BUILD+=	-I$(STAGING_DIR)/usr/include/heartbeat

pre-configure:
	$(SED) "s#@@STAGING_DIR@@#$(STAGING_DIR)#" $(WRKBUILD)/configure

pacemaker-install:
	$(INSTALL_DIR) $(IDIR_PACEMAKER)/usr/lib/heartbeat
	$(INSTALL_DIR) $(IDIR_PACEMAKER)/usr/lib/ocf
	$(CP) $(WRKINST)/usr/lib/lib*.so* \
		$(IDIR_PACEMAKER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/heartbeat/* \
		$(IDIR_PACEMAKER)/usr/lib/heartbeat
	$(CP) $(WRKINST)/usr/lib/ocf/* \
		$(IDIR_PACEMAKER)/usr/lib/ocf
	$(INSTALL_DIR) $(IDIR_PACEMAKER)/usr/share/pacemaker
	$(CP) $(WRKINST)/usr/share/pacemaker/* \
		$(IDIR_PACEMAKER)/usr/share/pacemaker
	$(INSTALL_DIR) $(IDIR_PACEMAKER)/usr/sbin
	$(CP) $(WRKINST)/usr/sbin/* \
		$(IDIR_PACEMAKER)/usr/sbin
	$(INSTALL_DIR) $(IDIR_PACEMAKER)/usr/libexec
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_PACEMAKER)/usr/libexec
	$(INSTALL_DIR) $(IDIR_PACEMAKER)/usr/lib/python2.7/site-packages
	$(CP) $(WRKINST)/usr/lib/python2.7/site-packages/* \
		$(IDIR_PACEMAKER)/usr/lib/python2.7/site-packages/
	-find ${IDIR_PACEMAKER} -name "\*.pyc" -o -name "*\.pyo" -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
