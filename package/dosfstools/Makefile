# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		dosfstools
PKG_VERSION:=		3.0.28
PKG_RELEASE:=		1
PKG_HASH:=		ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2
PKG_DESCR:=		utilities to create and check fat filesystems
PKG_SECTION:=		sys/fs
PKG_URL:=		http://www.daniel-baumann.ch/software/dosfstools/
PKG_SITES:=		https://github.com/dosfstools/dosfstools/releases/download/v$(PKG_VERSION)/

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DOSFSTOOLS,dosfstools,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_TARGET_LIBICONV_TINY),y)
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
