# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		kexec-tools
PKG_VERSION:=		2.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		bc401cf3262b25ff7c9a51fc76c8ab91
PKG_DESCR:=		kexec tools
PKG_SECTION:=		misc
PKG_DEPENDS:=		zlib
PKG_BUILDEP:=		zlib
PKG_URL:=		http://kernel.org/pub/linux/utils/kernel/kexec/
PKG_SITES:=		http://kernel.org/pub/linux/utils/kernel/kexec/

PKG_ARCH_DEPENDS:=	!cris !avr32
PKG_CFLINE_KEXEC_TOOLS:=	select ADK_KERNEL_KEXEC

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KEXEC_TOOLS,kexec-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

kexec-tools-install:
	$(INSTALL_DIR) $(IDIR_KEXEC_TOOLS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/kexec \
		$(IDIR_KEXEC_TOOLS)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
