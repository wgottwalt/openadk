# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		deco
PKG_VERSION:=		39
PKG_RELEASE:=		2
PKG_MD5SUM:=		f77f60e8be0cae1f814cba1ef61bf4d0
PKG_DESCR:=		full featured text-based file manager
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=deco/}

DISTFILES:=		${PKG_NAME}${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DECO,deco,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_DECO}/usr/bin ${IDIR_DECO}/usr/lib/deco
	${INSTALL_BIN} ${WRKBUILD}/deco ${IDIR_DECO}/usr/bin/deco
	${INSTALL_DATA} ${WRKBUILD}/profile ${IDIR_DECO}/usr/lib/deco/profile
	${INSTALL_DATA} ${WRKBUILD}/menu ${IDIR_DECO}/usr/lib/deco/menu

include ${TOPDIR}/mk/pkg-bottom.mk
