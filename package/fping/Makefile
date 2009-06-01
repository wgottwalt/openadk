# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fping
PKG_VERSION:=		2.4b2_to
PKG_RELEASE:=		1
PKG_MD5SUM:=		d5e8be59e307cef76bc479e1684df705
PKG_DESCR:=		A program to ping hosts in parallel
PKG_SECTION:=		net
PKG_URL:=		http://fping.sourceforge.net
PKG_SITES:=		http://fping.sourceforge.net/download/

DISTFILES:=		${PKG_NAME}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FPING,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu

do-build:
	${MAKE} CC="${TARGET_CC}" CFLAGS="${TARGET_CFLAGS}" -C ${WRKBUILD} clean ${PKG_NAME}
	mv ${WRKBUILD}/${PKG_NAME} ${WRKBUILD}/${PKG_NAME}4
ifeq ($(ADK_IPV6),y)
	${MAKE} CC="${TARGET_CC}" CFLAGS="${TARGET_CFLAGS} -DIPV6=1" -C ${WRKBUILD} clean ${PKG_NAME}
	mv ${WRKBUILD}/${PKG_NAME} ${WRKBUILD}/${PKG_NAME}6

endif

do-install:
	${INSTALL_DIR} ${IDIR_FPING}/usr/bin
	${CP} ${WRKBUILD}/${PKG_NAME}4 ${IDIR_FPING}/usr/bin/${PKG_NAME}
ifeq ($(ADK_IPV6),y)
	${CP} ${WRKBUILD}/${PKG_NAME}6 ${IDIR_FPING}/usr/bin/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
