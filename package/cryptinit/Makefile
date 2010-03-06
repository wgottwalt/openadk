# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cryptinit
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		1
PKG_BUILDDEP+=		cryptsetup lvm
PKG_DESCR:=		init for encrypted rootfilesystem
PKG_SECTION:=		base

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

CFLINE_CRYPTINIT:=	depends on ADK_TARGET_ROOTFS_ENCRYPTED

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CRYPTINIT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TCPPFLAGS} ${TCFLAGS} -c -o ${WRKBUILD}/cryptinit.o \
		${WRKBUILD}/cryptinit.c
	( cd ${WRKBUILD}; \
	${TARGET_CC} -static -o cryptinit cryptinit.o \
		 ${STAGING_DIR}/usr/lib/libcryptsetup.a \
		-L${STAGING_DIR}/lib -L${STAGING_DIR}/usr/lib \
		-ldevmapper -lpthread \
		${STAGING_DIR}/usr/lib/libgcrypt.a \
		${STAGING_DIR}/usr/lib/libgpg-error.a \
		-luuid -Wl,--rpath -Wl,${STAGING_DIR}/usr/lib \
	);

do-install:
	$(CP) ./files/initramfs_list $(LINUX_DIR)
	$(CP) ${WRKBUILD}/cryptinit $(LINUX_DIR)
	@touch ${IDIR_CRYPTINIT}/.empty

include ${TOPDIR}/mk/pkg-bottom.mk
