# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pacemaker
PKG_VERSION:=		1.1.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		3aaa95da2bdce96e0c244a2fb0e8b1e3
PKG_DESCR:=		scalable High-Availability cluster resource manager
PKG_SECTION:=		ha
PKG_BUILDDEP:=		resource-agents cluster-glue pam gnutls corosync libtool
PKG_DEPENDS:=		python2 python2-readline python2-bzip2 cluster-glue libuuid
PKG_DEPENDS+=		bash resource-agents pam libgnutls glib libxslt libxml2 libltdl librt
PKG_URL:=		http://www.clusterlabs.org/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_LIBC_DEPENDS:=	glibc musl
PKG_ARCH_DEPENDS:=	x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PACEMAKER,pacemaker,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-fatal-warnings \
			--with-corosync \
			--without-ais \
			--without-heartbeat
CONFIGURE_ENV+=		ac_cv_path_HELP2MAN=''

pacemaker-install:
	$(INSTALL_DIR) $(IDIR_PACEMAKER)/usr/lib/heartbeat
	$(INSTALL_DIR) $(IDIR_PACEMAKER)/usr/lib/ocf
	$(CP) $(WRKINST)/usr/lib/lib*.so* \
		$(IDIR_PACEMAKER)/usr/lib
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
