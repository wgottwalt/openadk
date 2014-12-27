# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		tar
PKG_VERSION:=		1.26
PKG_RELEASE:=		1
PKG_HASH:=		8e7959b8edfa1eeed75819d887a2da2412a4467ef7312f7242cfc6907854b332
PKG_DESCR:=		archiving application
PKG_SECTION:=		app/archive
PKG_URL:=		http://mirrors.kernel.org/gnu/tar/
PKG_SITES:=		http://mirrors.kernel.org/gnu/tar/
PKG_BB:=		1

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,TAR,tar,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,TAR,tar,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		gl_cv_func_mbrtowc_incomplete_state=no \
			gl_cv_func_wcrtomb_retval=no

tar-install:
	${INSTALL_DIR} ${IDIR_TAR}/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/tar ${IDIR_TAR}/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
