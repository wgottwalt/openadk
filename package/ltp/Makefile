# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ltp
PKG_VERSION:=		20140828
PKG_RELEASE:=		2
PKG_HASH:=		9e6264017a9087d9f9bd0fa2f2d96708f6b32bb8770fda03942a7a8cab8c6723
PKG_DESCR:=		linux test project
PKG_DEPENDS:=		bash libpthread librt
PKG_DEPENDS+=		mke2fs mkfs
PKG_SECTION:=		sys/misc
PKG_URL:=		http://linux-test-project.github.io
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ltp/}
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-full-${PKG_VERSION}.tar.xz
WRKDIST=		${WRKDIR}/${PKG_NAME}-full-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LTP,ltp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ARGS+=	--with-open-posix-testsuite \
			--with-realtime-testsuite \
			--without-power-management-testsuite \
			--without-python \
			--without-perl \
			--without-expect

pre-configure:
	$(MAKE) -C $(WRKBUILD) distclean
	$(MAKE) -C $(WRKBUILD) autotools

# bessel float version not implemented in uClibc
pre-build:
	-rm ${WRKBUILD}/testcases/misc/math/float/float_bessel.c
	-rm -rf ${WRKBUILD}/testcases/misc/math/float/bessel
	-rm -rf ${WRKBUILD}/testcases/network/{rpc,nfs*} 
	-rm -rf ${WRKBUILD}/testcases/kernel/syscalls/profil

ltp-install:
	$(INSTALL_DIR) $(IDIR_LTP)/opt/ltp/tmp
	$(CP) $(WRKINST)/usr/* $(IDIR_LTP)/opt/ltp

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
