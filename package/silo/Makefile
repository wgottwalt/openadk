# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		silo
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_HASH:=		add sha256 checksum of package here
PKG_DESCR:=		sparc bootloader
PKG_SECTION:=		base/boot
PKG_BUILDDEP:=		e2fsprogs
PKG_SITES:=		https://git.kernel.org/pub/scm/linux/kernel/git/davem/silo.git

PKG_ARCH_DEPENDS:=	sparc sparc64

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SILO,silo,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual

silo-install:
	$(INSTALL_DIR) $(IDIR_SILO)/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/silo \
		$(IDIR_SILO)/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
