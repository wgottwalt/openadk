# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		exmap
PKG_VERSION:=		0.4.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		55aec784e214037e61400287a55b5426
PKG_DESCR:=		memory analysing client tool
PKG_SECTION:=		debug
PKG_DEPENDS:=		exmap-kmod libreadline glib
PKG_BUILDDEP:=		glib readline autotool
PKG_SITES:=		http://labs.o-hand.com/sources/exmap-console/

PKG_ARCH_DEPENDS:=	!m68k
PKG_CFLINE_EXMAP:=	depends on !ADK_TOOLCHAIN_ONLY

PKG_SUBPKGS:=		EXMAP EXMAPD EXMAPSERVER EXMAP_KMOD
PKGSD_EXMAPD:=		memory analysing daemon
PKGSD_EXMAPSERVER:=	memory analysing server
PKGSD_EXMAP_KMOD:=	memory analysing kernel module
PKGSC_EXMAP_KMOD:=	kernel

DISTFILES:=		${PKG_NAME}-console-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}-console-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,EXMAP,exmap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,EXMAPD,exmapd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_EXMAPD},${PKG_SECTION}))
$(eval $(call PKG_template,EXMAPSERVER,exmapserver,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_EXMAPSERVER},${PKG_SECTION}))
$(eval $(call PKG_template,EXMAP_KMOD,exmap-kmod,${KERNEL_VERSION}+${PKG_VERSION}-${ADK_TARGET}-${PKG_RELEASE},,${PKGSD_EXMAP_KMOD},${PKGSC_EXMAP_KMOD}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-doc
CONFIGURE_ENV+=		LIBS="-lncurses"

pre-build:
	$(MAKE) -C ${WRKBUILD}/kernel $(KERNEL_MODULE_FLAGS)

post-install:
	${INSTALL_DIR} ${IDIR_EXMAP_KMOD}/etc/modules.d/
	echo "exmap" > ${IDIR_EXMAP_KMOD}/etc/modules.d/90-exmap
	${INSTALL_DIR} ${IDIR_EXMAP_KMOD}/lib/modules/${KERNEL_VERSION}/
	${INSTALL_DATA} ${WRKBUILD}/kernel/exmap.ko \
		${IDIR_EXMAP_KMOD}/lib/modules/${KERNEL_VERSION}
	${INSTALL_DIR} ${IDIR_EXMAP}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/exmap ${IDIR_EXMAP}/usr/sbin
	${INSTALL_DIR} ${IDIR_EXMAPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/exmapd ${IDIR_EXMAPD}/usr/sbin
	${INSTALL_DIR} ${IDIR_EXMAPSERVER}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/exmapserver ${IDIR_EXMAPSERVER}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
