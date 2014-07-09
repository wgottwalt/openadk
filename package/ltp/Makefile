# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ltp
PKG_VERSION:=		20140422
PKG_RELEASE:=		1
PKG_MD5SUM:=		6a98074e9121595ccb78951ebfeb698f
PKG_DESCR:=		linux test project
PKG_BUILDDEP:=		libtirpc
PKG_DEPENDS:=		bash libtirpc libpthread librt
PKG_DEPENDS+=		mke2fs mkfs
PKG_SECTION:=		sys/misc
PKG_URL:=		http://linux-test-project.github.io
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ltp/}
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-full-${PKG_VERSION}.tar.xz
WRKDIST=		${WRKDIR}/${PKG_NAME}-full-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LTP,ltp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/tirpc
TARGET_LDFLAGS+=	-ltirpc
CONFIGURE_ARGS+=	--with-open-posix-testsuite \
			--with-realtime-testsuite \
			--without-power-management-testsuite \
			--without-python \
			--without-perl \
			--without-expect

ltp-install:
	$(INSTALL_DIR) $(IDIR_LTP)/opt/ltp/tmp
	$(CP) $(WRKINST)/usr/* $(IDIR_LTP)/opt/ltp

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
