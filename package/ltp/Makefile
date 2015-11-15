# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ltp
PKG_VERSION:=		20150903
PKG_RELEASE:=		1
PKG_HASH:=		e670ae9f1e42bc8b500edd3c3a5cf09c6447c56d7738a22235c87a13739bcace
PKG_DESCR:=		linux test project
PKG_DEPENDS:=		bash mke2fs mkfs
PKG_NEEDS:=		threads rt
PKG_SECTION:=		sys/misc
PKG_URL:=		http://linux-test-project.github.io
PKG_SITES:=		https://github.com/linux-test-project/ltp/archive/
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}

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
	$(MAKE) -C $(WRKBUILD) distclean
	$(MAKE) -C $(WRKBUILD) autotools

# bessel float version not implemented in uClibc
# mallopt in uClibc-ng not implemented
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
