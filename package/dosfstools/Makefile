# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dosfstools
PKG_VERSION:=		3.0.26
PKG_RELEASE:=		4
PKG_MD5SUM:=		45012f5f56f2aae3afcd62120b9e5a08
PKG_DESCR:=		utilities to create and check FAT filesystems
PKG_SECTION:=		fs
PKG_BUILDDEP:=		libiconv-tiny
PKG_URL:=		http://www.daniel-baumann.ch/software/dosfstools/
PKG_SITES:=		http://daniel-baumann.ch/files/software/dosfstools/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DOSFSTOOLS,dosfstools,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		PREFIX=""

dosfstools-install:
	${INSTALL_DIR} ${IDIR_DOSFSTOOLS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/dosfsck ${IDIR_DOSFSTOOLS}/usr/sbin
	${CP} ${WRKINST}/sbin/fsck.{msdos,vfat,fat} ${IDIR_DOSFSTOOLS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/mkdosfs ${IDIR_DOSFSTOOLS}/usr/sbin
	${CP} ${WRKINST}/sbin/mkfs.{msdos,vfat,fat} ${IDIR_DOSFSTOOLS}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
