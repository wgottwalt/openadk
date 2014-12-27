# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		fbset
PKG_VERSION:=		2.1
PKG_RELEASE:=		2
PKG_HASH:=		40ff4ab0247b75138a0887ed40f81c1a6184f340b77126c16d074b1075b41c20
PKG_DESCR:=		framebuffer utility
PKG_DEPENDS:=		bison-host flex-host
PKG_SECTION:=		sys/hw
PKG_SITES:=		http://users.telenet.be/geertu/Linux/fbdev/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FBSET,fbset,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	(cd ${WRKSRC} && PATH='${HOST_PATH}' bison -d modes.y)
	(cd ${WRKSRC} && PATH='${HOST_PATH}' flex modes.l)
	${TARGET_CC} ${TARGET_CFLAGS} -I${WRKBUILD} -c -o \
		${WRKBUILD}/modes.tab.o ${WRKSRC}/modes.tab.c
	${TARGET_CC} ${TARGET_CFLAGS} -I${WRKBUILD} -c -o \
		${WRKBUILD}/lex.yy.o ${WRKSRC}/lex.yy.c
	${TARGET_CC} ${TARGET_CFLAGS} -I${WRKBUILD} -c -o \
		${WRKBUILD}/fbset.o ${WRKSRC}/fbset.c
	${TARGET_CC} ${TARGET_CFLAGS} -o ${WRKBUILD}/fbset \
		${WRKBUILD}/fbset.o \
		${WRKBUILD}/modes.tab.o \
		${WRKBUILD}/lex.yy.o

do-install:
	${INSTALL_DIR} ${IDIR_FBSET}/usr/bin
	${INSTALL_DIR} ${IDIR_FBSET}/etc
	${CP} ${WRKBUILD}/fbset ${IDIR_FBSET}/usr/bin
	${CP} ./files/fb.modes ${IDIR_FBSET}/etc

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
