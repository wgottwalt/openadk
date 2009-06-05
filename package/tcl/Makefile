# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tcl
PKG_VERSION:=		8.4.18
PKG_RELEASE:=		1
PKG_MD5SUM:=		7d8bc95036f797b1a2b62a5a382d2cc1
PKG_DESCR:=		the TCL scripting language
PKG_SECTION:=		lang
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=tcl/}

DISTFILES:=		tcl${PKG_VERSION}-src.tar.gz
WRKDIST=		${WRKDIR}/tcl${PKG_VERSION}
WRKSRC=			${WRKDIST}/unix

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TCL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		tcl_cv_strstr_unbroken=ok \
			tcl_cv_strtod_buggy=ok \
			tcl_cv_strtod_unbroken=ok \
			tcl_cv_strtoul_unbroken=ok
CONFIGURE_ARGS+=	--enable-man-symlinks
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_TCL}/usr/lib ${IDIR_TCL}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_TCL}/usr/bin
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_TCL}/usr/lib
	chmod u+w ${IDIR_TCL}/usr/lib/libtcl8.4.so	# for strip

include ${TOPDIR}/mk/pkg-bottom.mk
