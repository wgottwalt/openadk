# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pcc-libs
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		1
PKG_HASH:=		f89ac94e30927a28c78fc8b8b7fef617eeaf843e2268063d43e414cf3179dd62
PKG_DESCR:=		runtime for the portable c compiler
PKG_SECTION:=		dev/lang
PKG_URL:=		http://pcc.ludd.ltu.se/
PKG_SITES:=		http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/

PKG_CFLINE_PCC_LIBS:=	depends on ADK_BROKEN

PKG_ARCH_DEPENDS:=	!arm !m68k !mips !ppc
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PCC_LIBS,pcc-libs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=		$(filter-out -fstack-protector,$(TARGET_CFLAGS))
# we cross-compile a native compiler for the target system
CONFIGURE_ARGS+=	--host=${GNU_TARGET_NAME}
CONFIGURE_ARGS+=	--target=${GNU_TARGET_NAME}

pcc-libs-install:
	$(INSTALL_DIR) $(IDIR_PCC_LIBS)/usr/bin
	cd ${WRKINST} && cp -r * ${IDIR_PCC_LIBS}/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
