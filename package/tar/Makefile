# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tar
PKG_VERSION:=		1.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		efafad1b256e3de410f4fce5335d9c9d
PKG_DESCR:=		GNU tar
PKG_SECTION:=		utils
PKG_URL:=		http://mirrors.kernel.org/gnu/tar
PKG_SITES:=		ftp://ftp.informatik.rwth-aachen.de/pub/gnu/tar/ \
                	http://mirrors.kernel.org/gnu/tar/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TAR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		gl_cv_func_mbrtowc_incomplete_state=no \
			gl_cv_func_wcrtomb_retval=no
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_TAR}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/tar ${IDIR_TAR}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
