# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		syslinux
PKG_VERSION:=		6.02
PKG_RELEASE:=		1
PKG_MD5SUM:=		1df6ff6e4a82b9d7d71a9e7cb5851a5f
PKG_DESCR:=		lightweight bootloaders
PKG_SECTION:=		boot
HOST_BUILDDEP:=		nasm-host
PKG_URL:=		http://syslinux.zytor.com/wiki/index.php/The_Syslinux_Project
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/boot/syslinux/

PKG_CFLINE_SYSLINUX:=	depends on ADK_HOST_ONLY

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SYSLINUX,syslinux,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual
HOST_ALL_TARGET:=	bios installer

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

syslinux-hostinstall:
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/share/syslinux
	$(CP) $(WRKBUILD)/bios/core/isolinux.bin \
		$(STAGING_HOST_DIR)/usr/share/syslinux
	$(CP) $(WRKBUILD)/bios/com32/elflink/ldlinux/ldlinux.c32 \
		$(STAGING_HOST_DIR)/usr/share/syslinux

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
