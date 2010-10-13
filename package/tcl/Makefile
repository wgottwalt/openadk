# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tcl
PKG_VERSION:=		8.5.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		7f123e53b3daaaba2478d3af5a0752e3
PKG_DESCR:=		TCL scripting language
PKG_SECTION:=		lang
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=tcl/}

PKG_HOST_DEPENDS:=	!darwin

DISTFILES:=		tcl${PKG_VERSION}-src.tar.gz
WRKDIST=		${WRKDIR}/tcl${PKG_VERSION}
WRKSRC=			${WRKDIST}/unix

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TCL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-ldl
CONFIGURE_ENV+=		tcl_cv_strstr_unbroken=ok \
			tcl_cv_strtod_buggy=ok \
			tcl_cv_strtod_unbroken=ok \
			tcl_cv_strtoul_unbroken=ok
CONFIGURE_ARGS+=	--enable-man-symlinks
INSTALL_TARGET=		install-binaries install-libraries

post-install:
	${INSTALL_DIR} ${IDIR_TCL}/usr/lib ${IDIR_TCL}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_TCL}/usr/bin
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_TCL}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
