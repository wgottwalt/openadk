# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		joe
PKG_VERSION:=		3.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		66de1b073e869ba12abbfcde3885c577
PKG_DESCR:=		JOE - Joe's Own Editor
PKG_SECTION:=		editor
PKG_URL:=		http://joe-editor.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=joe-editor/}

PKG_FLAVOURS_JOE:=	DOC LANGUAGE SYNTAX
PKGFD_DOC:=		Install documentation
PKGFD_LANGUAGE:=	Install translation files
PKGFD_SYNTAX:=		Install syntax highlighting files

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,JOE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_JOE}/usr/bin
	${INSTALL_DIR} ${IDIR_JOE}/etc/joe
	${CP} ${WRKINST}/usr/bin/* ${IDIR_JOE}/usr/bin
	${CP} ${WRKINST}/etc/joe/* ${IDIR_JOE}/etc/joe

ifeq (${ADK_PACKAGE_JOE_DOC},y)
	${INSTALL_DIR} ${IDIR_JOE}/usr/share/doc
	${INSTALL_DIR} ${IDIR_JOE}/usr/share/man
	${CP} ${WRKINST}/usr/share/doc/* ${IDIR_JOE}/usr/share/doc
	${CP} ${WRKINST}/usr/share/man/* ${IDIR_JOE}/usr/share/man
endif

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
