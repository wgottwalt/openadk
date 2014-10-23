# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kexec-tools
PKG_VERSION:=		2.0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		2c4dec4e857e84ca530478bac0ec114b
PKG_DESCR:=		kernel exec tools
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		zlib
PKG_BUILDEP:=		zlib
PKG_URL:=		http://kernel.org/pub/linux/utils/kernel/kexec/
PKG_SITES:=		${MASTER_SITE_KERNEL:=utils/kernel/kexec/}

PKG_ARCH_DEPENDS:=	!mips !m68k
PKG_CFLINE_KEXEC_TOOLS:=	select ADK_KERNEL_KEXEC

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KEXEC_TOOLS,kexec-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

kexec-tools-install:
	$(INSTALL_DIR) $(IDIR_KEXEC_TOOLS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/kexec \
		$(IDIR_KEXEC_TOOLS)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
