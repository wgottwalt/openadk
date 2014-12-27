# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		openafs
PKG_VERSION:=		1.6.5.1
PKG_RELEASE:=		1
PKG_HASH:=		cdcf169bf972502ff4a7b79045c9686cfcffd66b2059b1806c1ffbf3bd1c9ac0
PKG_DESCR:=		afs implementation
PKG_SECTION:=		net/fs
PKG_URL:=		http://openafs.org
PKG_SITES:=		http://www.openafs.org/dl/openafs/${PKG_VERSION}/

PKG_LIBC_DEPENDS:=	glibc musl
PKG_CFLINE_OPENAFS+=	select ADK_KERNEL_KEYS

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-src.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENAFS,openafs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ENV+=		ac_cv_path_PATH_CPP=$(TARGET_CROSS)cpp
CONFIGURE_ARGS:=	--with-afs-sysname=$(ADK_TARGET_ARCH)_linux26 \
			--with-linux-kernel-headers=${LINUX_DIR} \
			--disable-strip-binaries \
			--disable-linux-syscall-probing

openafs-install:
	$(INSTALL_DIR) $(IDIR_OPENAFS)/usr/bin
	$(INSTALL_DIR) $(IDIR_OPENAFS)/usr/lib
	$(INSTALL_DIR) $(IDIR_OPENAFS)/usr/sbin
	$(INSTALL_DIR) $(IDIR_OPENAFS)/usr/libexec/openafs
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_OPENAFS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/* \
		$(IDIR_OPENAFS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/openafs/* \
		$(IDIR_OPENAFS)/usr/libexec/openafs
	$(CP) $(WRKINST)/usr/lib/*.so* \
		$(IDIR_OPENAFS)/usr/lib
	${INSTALL_DIR} ${IDIR_OPENAFS}/etc/modules.d/
	echo "libafs" > ${IDIR_OPENAFS}/etc/modules.d/90-libafs
	${INSTALL_DIR} ${IDIR_OPENAFS}/lib/modules/${KERNEL_VERSION}
	$(CP) $(WRKINST)/usr/lib/openafs/libafs-${KERNEL_VERSION}.ko \
		$(IDIR_OPENAFS)/lib/modules/${KERNEL_VERSION}/libafs.ko

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
