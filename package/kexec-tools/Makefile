# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kexec-tools
PKG_VERSION:=		2.0.9
PKG_RELEASE:=		1
PKG_HASH:=		8ae34a9ceb76350954e1e1e3ca9ab51da15862bd5f2fd14392208e60fb454f71
PKG_DESCR:=		kernel exec tools
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		zlib
PKG_BUILDEP:=		zlib
PKG_KDEPENDS:=		kexec
PKG_URL:=		http://kernel.org/pub/linux/utils/kernel/kexec/
PKG_SITES:=		${MASTER_SITE_KERNEL:=utils/kernel/kexec/}

PKG_ARCH_DEPENDS:=	!mips !m68k

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KEXEC_TOOLS,kexec-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

kexec-tools-install:
	$(INSTALL_DIR) $(IDIR_KEXEC_TOOLS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/kexec \
		$(IDIR_KEXEC_TOOLS)/usr/sbin
	$(INSTALL_BIN) ./files/kreboot $(IDIR_KEXEC_TOOLS)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
