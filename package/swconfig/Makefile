# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		swconfig
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		switch configuration utility
PKG_SECTION:=		misc
PKG_DEPENDS:=		libnl
PKG_BUILDDEP+=		libnl

PKG_TARGET_CONFIG:=	rb433

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SWCONFIG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

XAKE_FLAGS:=		LIBS="-lnl -lm" CFLAGS="$(TARGET_CFLAGS) \
			-I$(LINUX_DIR)/include"

do-install:
	${INSTALL_DIR} ${IDIR_SWCONFIG}/sbin
	${INSTALL_BIN} ${WRKBUILD}/swconfig ${IDIR_SWCONFIG}/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
