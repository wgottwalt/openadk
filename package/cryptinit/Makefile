# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cryptinit
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		1
PKG_DESCR:=		init for encrypted rootfilesystem
PKG_SECTION:=		base
PKG_BUILDDEP:=		cryptsetup lvm

PKG_CFLINE_CRYPTINIT:=	depends on ADK_TARGET_ROOTFS_ENCRYPTED

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CRYPTINIT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} -c \
		-o ${WRKBUILD}/cryptinit.o ${WRKBUILD}/cryptinit.c
	( cd ${WRKBUILD}; \
	${TARGET_CC} -static -o cryptinit cryptinit.o \
		 ${STAGING_TARGET_DIR}/usr/lib/libcryptsetup.a \
		-L${STAGING_TARGET_DIR}/lib -L${STAGING_TARGET_DIR}/usr/lib \
		-ldevmapper -lpthread \
		${STAGING_TARGET_DIR}/usr/lib/libgcrypt.a \
		${STAGING_TARGET_DIR}/usr/lib/libgpg-error.a \
		-luuid -Wl,--rpath -Wl,${STAGING_TARGET_DIR}/usr/lib \
	);

do-install:
	$(CP) ./files/initramfs_list $(LINUX_DIR)
	$(CP) ${WRKBUILD}/cryptinit $(LINUX_DIR)
	@touch ${IDIR_CRYPTINIT}/.empty

include ${TOPDIR}/mk/pkg-bottom.mk
