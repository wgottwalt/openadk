# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		dosfstools
PKG_VERSION:=		3.0.26
PKG_RELEASE:=		5
PKG_HASH:=		468442fe8cd93961047d5cd67f7b67793126575103a67cd131330512b4893e75
PKG_DESCR:=		utilities to create and check fat filesystems
PKG_SECTION:=		sys/fs
PKG_URL:=		http://www.daniel-baumann.ch/software/dosfstools/
PKG_SITES:=		http://daniel-baumann.ch/files/software/dosfstools/

PKG_BUILDDEP_UCLIBC:=	libiconv-tiny
PKG_BUILDDEP_UCLIBC_NG:=libiconv-tiny

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DOSFSTOOLS,dosfstools,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_TARGET_LIB_UCLIBC)$(ADK_TARGET_LIB_UCLIBC_NG),y)
XAKE_FLAGS+=		LDLIBS=-liconv
endif

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		PREFIX=""

dosfstools-install:
	${INSTALL_DIR} ${IDIR_DOSFSTOOLS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/dosfsck ${IDIR_DOSFSTOOLS}/usr/sbin
	${CP} ${WRKINST}/sbin/fsck.{msdos,vfat,fat} ${IDIR_DOSFSTOOLS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/mkdosfs ${IDIR_DOSFSTOOLS}/usr/sbin
	${CP} ${WRKINST}/sbin/mkfs.{msdos,vfat,fat} ${IDIR_DOSFSTOOLS}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
