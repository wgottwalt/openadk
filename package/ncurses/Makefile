# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ncurses
PKG_VERSION:=		5.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		cce05daf61a64501ef6cd8da1f727ec6
MASTER_SITES:=		${MASTER_SITE_GNU:=ncurses/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNCURSES,libncurses,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_linux_vers=2
CONFIGURE_ARGS+=	--without-cxx \
			--without-cxx-binding \
			--without-progs \
			--with-fallbacks \
			--without-ada \
			--with-shared \
			--with-normal \
			--without-debug \
			--without-profile \
			--without-gpm \
			--enable-overwrite \
			--with-terminfo-dirs=/usr/share/terminfo \
			--with-default-terminfo-dir=/usr/share/terminfo \
			--disable-big-core \
			--disable-home-terminfo \
			--without-rcs-ids \
			--enable-const \
			--enable-echo
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog
ALL_TARGET:=		libs
INSTALL_TARGET:=	install.libs install.data


pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure \
		--with-build-cc=${HOSTCC} \
		--with-progs \
	);
	${MAKE} -C ${WRKBUILD}/include
	${MAKE} -C ${WRKBUILD}/progs

post-install:
	# this is installed as libncurses - make libcurses a "link"
	rm -f ${WRKINST}/usr/lib/libcurses.so*
	echo 'GROUP(-lncurses)' >${WRKINST}/usr/lib/libcurses.so
	# libcurses will not show up in the IPKG, only in STAGING_DIR
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share/terminfo
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib{form,menu,ncurses,panel}.so.* \
	    ${IDIR_LIBNCURSES}/usr/lib
	for f in a/ansi d/dumb l/linux r/rxvt s/screen v/vt100 v/vt102 \
	    v/vt220 w/wsvt25 x/xterm x/xterm-color x/xterm-xfree86; do \
		${INSTALL_DIR} \
		    ${IDIR_LIBNCURSES}/usr/share/terminfo/$$(dirname $$f); \
		${INSTALL_DATA} ${WRKINST}/usr/share/terminfo/$$f \
		    ${IDIR_LIBNCURSES}/usr/share/terminfo/$$f; \
	done

include ${TOPDIR}/mk/pkg-bottom.mk
