# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		slurm
PKG_VERSION:=		0.3.3
PKG_RELEASE:=		1
PKG_DESCR:=		Realtime network interface monitor
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses
PKG_MD5SUM:=		e68d09202b835c644f7f6b7f070f29a2
PKG_SITES:=		http://www.wormulon.net/files/slurm/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SLURM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	LIBS="-lncurses" \
			ac_cv_lib_ncurses_use_default_colors=yes
BUILD_STYLE:=		auto
MAKE_FLAGS:=		CPPFLAGS="${TCPPFLAGS}" CFLAGS="${TCFLAGS}" LDFLAGS="${TLDFLAGS}"
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_SLURM}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/slurm ${IDIR_SLURM}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
