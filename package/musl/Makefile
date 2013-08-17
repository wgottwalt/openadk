# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/musl/Makefile.inc

PKG_DESCR:=		embedded C library
PKG_SECTION:=		base
PKG_OPTS:=		noremove

PKG_SUBPKGS:=		MUSL MUSL_DEV
PKGSD_MUSL_DEV:=	development files for musl
PKGSC_MUSL_DEV:=	devel

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MUSL,musl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,MUSL_DEV,musl-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_MUSL_DEV},${PKGSC_MUSL_DEV},${PKG_OPTS}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

# do nothing, musl is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_MUSL)/usr/bin
	${INSTALL_DIR} $(IDIR_MUSL)/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/usr/lib/libc.so $(IDIR_MUSL)/$(ADK_TARGET_LIBC_PATH)
	(cd $(IDIR_MUSL)/$(ADK_TARGET_LIBC_PATH) && \
		ln -sf libc.so ld-musl-$(CPU_ARCH).so.1)
	(cd $(IDIR_MUSL)/usr/bin && \
		ln -sf ../../lib/ld-musl-$(CPU_ARCH).so.1 ldd)
	

musl-dev-install:
	${INSTALL_DIR} ${IDIR_MUSL_DEV}/usr/lib 
	${CP} ${STAGING_TARGET_DIR}/usr/lib/crt*.o ${IDIR_MUSL_DEV}/usr/lib
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)-$(KERNEL_RELEASE)/linux-$(KERNEL_VERSION) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(IDIR_MUSL_DEV)/usr \
		headers_install
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION} \
		install_headers
	@find $(IDIR_MUSL_DEV) -name .install -exec rm {} \;
	@find $(IDIR_MUSL_DEV) -name ..install.cmd -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
