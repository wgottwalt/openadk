# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		arcboot
PKG_VERSION:=		0.3.15
PKG_RELEASE:=		1
PKG_HASH:=		f197eb1a205530cb5d8abc6344cb66dd18cf012fad477204dd87a7e93c30b17c
PKG_DESCR:=		arc boot loader
PKG_SECTION:=		base/boot
PKG_BUILDDEP:=		e2fsprogs
PKG_URL:=		https://honk.sigxcpu.org/piki/projects/arcboot/
PKG_SITES:=		http://http.debian.net/debian/pool/main/a/arcboot/

DISTFILES:=		$(PKG_NAME)_$(PKG_VERSION).tar.gz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)

PKG_ARCH_DEPENDS:=	mips mips64

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ARCBOOT,arcboot,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

XAKE_FLAGS+=		E2FSINCLUDEDIR='$(STAGING_TARGET_DIR)/usr/include/ext2fs' \
			EXT2LIB='$(STAGING_TARGET_DIR)/usr/lib/libext2fs.a'

CONFIG_STYLE:=		manual

arcboot-install:
	$(INSTALL_DIR) $(IDIR_ARCBOOT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/arcboot \
		$(IDIR_ARCBOOT)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
