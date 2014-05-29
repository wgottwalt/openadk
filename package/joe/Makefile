# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		joe
PKG_VERSION:=		3.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		66de1b073e869ba12abbfcde3885c577
PKG_DESCR:=		small editor
PKG_SECTION:=		app/editor
PKG_URL:=		http://joe-editor.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=joe-editor/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_JOE:=	LANGUAGE SYNTAX
PKGFD_LANGUAGE:=	install translation files
PKGFD_SYNTAX:=		install syntax highlighting files

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,JOE,joe,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

joe-install:
	${INSTALL_DIR} ${IDIR_JOE}/usr/bin
	${INSTALL_DIR} ${IDIR_JOE}/etc/joe
	${CP} ${WRKINST}/usr/bin/* ${IDIR_JOE}/usr/bin
	${CP} ${WRKINST}/etc/joe/* ${IDIR_JOE}/etc/joe
ifeq (${ADK_PACKAGE_JOE_LANGUAGE},y)
	${INSTALL_DIR} ${IDIR_JOE}/usr/share/joe/lang
	${CP} ${WRKINST}/usr/share/joe/lang/* ${IDIR_JOE}/usr/share/joe/lang
endif
ifeq (${ADK_PACKAGE_JOE_SYNTAX},y)
	${INSTALL_DIR} ${IDIR_JOE}/usr/share/joe/syntax
	${INSTALL_DIR} ${IDIR_JOE}/usr/share/joe/charmaps
	${CP} ${WRKINST}/usr/share/joe/syntax/* ${IDIR_JOE}/usr/share/joe/syntax
	${CP} ${WRKINST}/usr/share/joe/charmaps/* ${IDIR_JOE}/usr/share/joe/charmaps
endif

include ${TOPDIR}/mk/pkg-bottom.mk
