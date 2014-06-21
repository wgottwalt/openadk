# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		syslinux
PKG_VERSION:=		6.02
PKG_RELEASE:=		1
PKG_MD5SUM:=		6f275813a1b08cf852e55c0a3f8fbc78
PKG_DESCR:=		lightweight bootloaders
PKG_SECTION:=		base/boot
HOST_BUILDDEP:=		nasm-host
PKG_URL:=		http://syslinux.zytor.com/wiki/index.php/The_Syslinux_Project
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/boot/syslinux/

PKG_SUBPKGS:=		PXELINUX
PKGSD_PXELINUX:=	pxelinux

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SYSLINUX,syslinux,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,PXELINUX,pxelinux,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		manual
HOST_ALL_TARGET:=	bios installer
CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

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

pxelinux-install:
	$(INSTALL_DIR) ${IDIR_PXELINUX}/tftpboot/pxelinux.cfg
	$(CP) $(WRKBUILD)/bios/core/pxelinux.0 \
		${IDIR_PXELINUX}/tftpboot
	$(CP) $(WRKBUILD)/bios/com32/elflink/ldlinux/ldlinux.c32 \
		${IDIR_PXELINUX}/tftpboot
	$(CP) ./files/default ${IDIR_PXELINUX}/tftpboot/pxelinux.cfg

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
