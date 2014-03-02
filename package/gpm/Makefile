# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gpm
PKG_VERSION:=		1.20.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		e9a4ba2711753c89b37950aada7aed4a
PKG_DESCR:=		console mouse support
PKG_SECTION:=		misc
PKG_BUILDDEP:=		autotool bison-host
PKG_URL:=		http://launchpad.net/gpm
PKG_SITES:=		http://www.nico.schottelius.org/software/gpm/archives/
PKG_NOPARALLEL:=	1
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPM,gpm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autogen
TARGET_CPPFLAGS+=	-I${WRKSRC}/src/headers

gpm-install:
	${INSTALL_DIR} ${IDIR_GPM}/usr/sbin ${IDIR_GPM}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/gpm ${IDIR_GPM}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/libgpm.so.* ${IDIR_GPM}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
