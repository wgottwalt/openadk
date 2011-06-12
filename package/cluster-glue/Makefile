# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cluster-glue
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		237d396094a3cded73f9f0ad45558a21
PKG_DESCR:=		Cluster Glue library and tools
PKG_SECTION:=		ha
PKG_BUILDDEP:=		glib bzip2 e2fsprogs
PKG_URL:=		http://www.linux-ha.org/wiki/Cluster_Glue
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CLUSTER_GLUE,cluster-glue,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ENV+=		ac_cv_path_HELP2MAN=''
CONFIGURE_ARGS+=	--disable-bundled-ltdl \
			--enable-fatal-warnings=no

cluster-glue-install:
	$(INSTALL_DIR) $(IDIR_CLUSTER_GLUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/*.so* \
		$(IDIR_CLUSTER_GLUE)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
