# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ltp
PKG_VERSION:=		20170116
PKG_RELEASE:=		1
PKG_DESCR:=		linux test project
PKG_HASH:=		c6595219da001dc99697a64cbb26e1c5a3f15cfa2f760a88d8bf0ebe595b0cb4
PKG_DEPENDS:=		bash mke2fs mkfs
PKG_NEEDS:=		threads
PKG_SECTION:=		base/tests
PKG_URL:=		http://linux-test-project.github.io
PKG_SITES:=		https://github.com/linux-test-project/ltp/releases/download/$(PKG_VERSION)/
PKG_NOPARALLEL:=	1

DISTFILES:=		$(PKG_NAME)-full-$(PKG_VERSION).tar.xz

WRKDIST=		$(WRKDIR)/$(PKG_NAME)-full-$(PKG_VERSION)

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LTP,ltp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# disable lto
TARGET_CFLAGS:=		$(filter-out -flto,$(TARGET_CFLAGS))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ARGS+=	--with-open-posix-testsuite \
			--with-realtime-testsuite \
			--without-power-management-testsuite \
			--without-python \
			--without-perl \
			--without-expect

pre-configure:
	$(MAKE) -C $(WRKBUILD) autotools

# bessel float and mallopt not implemented in uClibc-ng
pre-build:
	-rm ${WRKBUILD}/testcases/misc/math/float/float_bessel.c
	-rm -rf ${WRKBUILD}/testcases/misc/math/float/bessel
	-rm -rf ${WRKBUILD}/testcases/network/{rpc,nfs*} 
	-rm -rf ${WRKBUILD}/testcases/kernel/syscalls/profil
	-rm -rf ${WRKBUILD}/testcases/kernel/syscalls/mallopt

ltp-install:
	$(INSTALL_DIR) $(IDIR_LTP)/opt/ltp/tmp
	$(CP) $(WRKINST)/usr/* $(IDIR_LTP)/opt/ltp

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
