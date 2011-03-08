# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tcl
PKG_VERSION:=		8.5.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		8512d8db3233041dd68a81476906012a
PKG_DESCR:=		TCL scripting language
PKG_SECTION:=		lang
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=tcl/}

DISTFILES:=		tcl${PKG_VERSION}-src.tar.gz
WRKDIST=		${WRKDIR}/tcl${PKG_VERSION}
WRKSRC=			${WRKDIST}/unix

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TCL,tcl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ldl
CONFIGURE_ENV+=		tcl_cv_strstr_unbroken=ok \
			tcl_cv_strtod_buggy=ok \
			tcl_cv_strtod_unbroken=ok \
			tcl_cv_strtoul_unbroken=ok \
			tcl_cv_sys_version="Linux-2.6"
CONFIGURE_ARGS+=	--enable-man-symlinks \
			--disable-rpath
INSTALL_TARGET=		install-binaries install-libraries

tcl-install:
	${INSTALL_DIR} ${IDIR_TCL}/usr/lib ${IDIR_TCL}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_TCL}/usr/bin
	cd ${IDIR_TCL}/usr/bin && ln -sf tclsh8.5 tclsh
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_TCL}/usr/lib
	${CP} ${WRKINST}/usr/lib/tcl8 ${IDIR_TCL}/usr/lib
	${CP} ${WRKINST}/usr/lib/tcl8.5 ${IDIR_TCL}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
