# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cluster-glue
PKG_VERSION:=		1.0.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		bd5a20fc9185da17caf113776d1eac47
PKG_DESCR:=		Cluster Glue library and tools
PKG_SECTION:=		ha
PKG_BUILDDEP:=		glib bzip2 e2fsprogs libaio
PKG_DEPENDS:=		libaio
PKG_URL:=		http://www.linux-ha.org/wiki/Cluster_Glue
PKG_SITES:=		http://openadk.org/distfiles/
PKG_NOPARALLEL:=	1

PKG_LIBC_DEPENDS:=	glibc musl
PKG_ARCH_DEPENDS:=	x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CLUSTER_GLUE,cluster-glue,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ENV+=		ac_cv_path_HELP2MAN=''
CONFIGURE_ARGS+=	--disable-bundled-ltdl \
			--enable-fatal-warnings=no

TARGET_CPPFLAGS+=	-DCONFIG_LITTLE_ENDIAN
ifeq (${CPU_ARCH},mips)
TARGET_CPPFLAGS+=		-DCONFIG_BIG_ENDIAN
endif
ifeq (${CPU_ARCH},mips64)
TARGET_CPPFLAGS+=		-DCONFIG_BIG_ENDIAN
endif
ifeq (${CPU_ARCH},ppc)
TARGET_CPPFLAGS+=		-DCONFIG_BIG_ENDIAN
endif

cluster-glue-install:
	$(INSTALL_DIR) $(IDIR_CLUSTER_GLUE)/usr/lib/heartbeat
	$(CP) $(WRKINST)/usr/lib/*.so* \
		$(IDIR_CLUSTER_GLUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/heartbeat/* \
		$(IDIR_CLUSTER_GLUE)/usr/lib/heartbeat

include ${TOPDIR}/mk/pkg-bottom.mk
