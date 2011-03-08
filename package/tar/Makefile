# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tar
PKG_VERSION:=		1.25
PKG_RELEASE:=		1
PKG_MD5SUM:=		0e48e9e473a72f135d0ebbc8af2762cc
PKG_DESCR:=		GNU archiving application
PKG_SECTION:=		archive
PKG_URL:=		http://mirrors.kernel.org/gnu/tar/
PKG_SITES:=		http://mirrors.kernel.org/gnu/tar/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TAR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		gl_cv_func_mbrtowc_incomplete_state=no \
			gl_cv_func_wcrtomb_retval=no

post-install:
	${INSTALL_DIR} ${IDIR_TAR}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/tar ${IDIR_TAR}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
