# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ltp
PKG_VERSION:=		20180515
PKG_RELEASE:=		1
PKG_DESCR:=		linux test project
PKG_HASH:=		8c41f10fa26cf01b50ae91374e3e9570f9a321286560626e182d159aba82d915
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

CONFIGURE_ARGS+=	--with-open-posix-testsuite \
			--with-realtime-testsuite \
			--without-power-management-testsuite \
			--without-python \
			--without-perl \
			--without-expect

pre-configure:
	PATH="$(HOST_PATH)" $(MAKE) -C $(WRKBUILD) autotools

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
