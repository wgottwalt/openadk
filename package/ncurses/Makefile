# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ncurses
PKG_VERSION:=		5.7
PKG_RELEASE:=		4
PKG_MD5SUM:=		cce05daf61a64501ef6cd8da1f727ec6
PKG_DESCR:=		a terminal handling library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnu.org/software/ncurses/
PKG_SITES:=		${MASTER_SITE_GNU:=ncurses/}

PKG_SUBPKGS:=		LIBNCURSES LIBNCURSES_DEV
PKGSD_LIBNCURSES_DEV:=	development files for libncurses
PKGSC_LIBNCURSES_DEV:=	devel

PKG_FLAVOURS_LIBNCURSES:=	FULL_TERMINFO
PKGFD_FULL_TERMINFO:=		install the complete set of terminfo files as provided upstream

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNCURSES,libncurses,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNCURSES_DEV,libncurses-dev,${PKG_VERSION}-${PKG_RELEASE},libncurses,${PKGSD_LIBNCURSES_DEV},${PKGSC_LIBNCURSES_DEV}))

CONFIGURE_ENV+=		ac_cv_linux_vers=2
CONFIGURE_ARGS+=	--without-cxx \
			--without-cxx-binding \
			--with-build-cc=${CC_FOR_BUILD} \
			--without-progs \
			--with-fallbacks \
			--disable-termcap \
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
ALL_TARGET:=		libs
INSTALL_TARGET:=	install.libs install.data

pre-configure:
	# create tic host binary
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure \
		--with-shared \
		--with-build-cc=${CC_FOR_BUILD} \
		--with-progs \
		--without-debug \
		--without-profile \
	);
	${MAKE} -C ${WRKBUILD}/include
	${MAKE} -C ${WRKBUILD}/progs
	${CP} ${WRKBUILD}/progs/tic ${STAGING_HOST_DIR}/bin
	find ${WRKBUILD} -name *.o -exec rm {} \;
	find ${WRKBUILD} -name *.a -exec rm {} \;

post-install:
	# this is installed as libncurses - make libcurses a "link"
	rm -f ${WRKINST}/usr/lib/libcurses.so*
	echo 'GROUP(-lncurses)' >${WRKINST}/usr/lib/libcurses.so
	# libcurses will not show up in the IPKG, only in STAGING_TARGET_DIR
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib{form,menu,ncurses,panel}.so* \
	    ${IDIR_LIBNCURSES}/usr/lib
ifeq (${ADK_PACKAGE_LIBNCURSES_FULL_TERMINFO},y)
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share
	${CP} ${WRKINST}/usr/share/terminfo ${IDIR_LIBNCURSES}/usr/share/
else
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share/terminfo/
	for f in ansi dumb linux screen vt100 vt102 \
	    rxvt-unicode vt220 xterm xterm-color xterm-xfree86; do \
		${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share/terminfo/$${f:0:1}; \
		${INSTALL_DATA} ${WRKINST}/usr/share/terminfo/*/$$f \
		    ${IDIR_LIBNCURSES}/usr/share/terminfo/$${f:0:1}/$$f; \
	done
endif

libncurses-dev-install:
	${INSTALL_DIR} ${IDIR_LIBNCURSES_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBNCURSES_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBNCURSES_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ncurses5-config \
		${IDIR_LIBNCURSES_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
