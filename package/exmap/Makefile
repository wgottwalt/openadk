# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		exmap
PKG_VERSION:=		0.4.1
PKG_RELEASE:=		1
PKG_BUILDDEP+=		glib readline
PKG_MD5SUM:=		55aec784e214037e61400287a55b5426
PKG_DESCR:=		memory analysing tool
PKG_SECTION:=		utils
PKG_SITES:=		http://labs.o-hand.com/sources/exmap-console/

DISTFILES:=		${PKG_NAME}-console-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}-console-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,EXMAP,exmap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,EXMAPD,exmapd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,EXMAPSERVER,exmapserver,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,KMOD_EXMAP,kmod-exmap,${KERNEL_VERSION}+${PKG_VERSION}-${TARGET}-${PKG_RELEASE},,${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-doc
CONFIGURE_ENV+=		LIBS="-lncurses"
BUILD_STYLE:=		auto

pre-build:
	KERNEL_PATH=${LINUX_DIR} \
	CROSS_COMPILE="${TARGET_CROSS}" \
	V=1 ARCH="${ARCH}" KERNELVERSION="2.6" \
	LDFLAGS="" \
	$(MAKE) -C ${WRKBUILD}/kernel

post-install:
	${INSTALL_DIR} ${IDIR_KMOD_EXMAP}/etc/modules.d/
	echo "exmap" > ${IDIR_KMOD_EXMAP}/etc/modules.d/90-exmap
	${INSTALL_DIR} ${IDIR_KMOD_EXMAP}/lib/modules/${KERNEL_VERSION}/
	${INSTALL_DATA} ${WRKBUILD}/kernel/exmap.ko \
		${IDIR_KMOD_EXMAP}/lib/modules/${KERNEL_VERSION}
	${INSTALL_DIR} ${IDIR_EXMAP}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/exmap ${IDIR_EXMAP}/usr/sbin
	${INSTALL_DIR} ${IDIR_EXMAPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/exmapd ${IDIR_EXMAPD}/usr/sbin
	${INSTALL_DIR} ${IDIR_EXMAPSERVER}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/exmapserver ${IDIR_EXMAPSERVER}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
