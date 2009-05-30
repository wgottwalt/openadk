# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dosfstools
PKG_VERSION:=		3.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		94c2ea84b191de958f765ee239457bd9
PKG_DESCR:=		Utilities to create and check MS-DOS FAT filesystems
PKG_SECTION:=		admin
PKG_URL:=		http://www.daniel-baumann.ch/software/dosfstools
PKG_SITES:=		http://www.daniel-baumann.ch/software/dosfstools/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DOSFSTOOLS,dosfstools,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE=		auto
INSTALL_STYLE=		auto
XAKE_FLAGS+=		PREFIX="" \
			OPTFLAGS="${TARGET_CFLAGS} -D_FILE_OFFSET_BITS=64"

post-install:
	${INSTALL_DIR} ${IDIR_DOSFSTOOLS}/sbin
	${CP} ${WRKINST}/sbin/dosfsck ${IDIR_DOSFSTOOLS}/sbin/
	${CP} ${WRKINST}/sbin/fsck.{msdos,vfat} ${IDIR_DOSFSTOOLS}/sbin/
	${CP} ${WRKINST}/sbin/mkdosfs ${IDIR_DOSFSTOOLS}/sbin/
	${CP} ${WRKINST}/sbin/mkfs.{msdos,vfat} ${IDIR_DOSFSTOOLS}/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
