# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ncurses
PKG_VERSION:=		5.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		cce05daf61a64501ef6cd8da1f727ec6
PKG_DESCR:=		a terminal handling library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnu.org/software/ncurses/
PKG_SITES:=		${MASTER_SITE_GNU:=ncurses/}

PKG_DESCR_LIB_DEV:=	development files for libncurses
PKG_SECTION_LIB_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNCURSES,libncurses,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNCURSES_DEV,libncurses-dev,${PKG_VERSION}-${PKG_RELEASE},libncurses,${PKG_DESCR_LIB_DEV},${PKG_SECTION_LIB_DEV}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_LIBNCURSES_DEV}+=	libncurses-dev-install

CONFIGURE_ENV+=		ac_cv_linux_vers=2
CONFIGURE_ARGS+=	--without-cxx \
			--without-cxx-binding \
			--with-build-cc=${HOSTCC} \
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

ifeq (${ADK_HOST_CYGWIN},y)
CONFOPT:=		--with-shared
endif

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure \
		${CONFOPT} \
		--with-build-cc=${HOSTCC} \
		--with-progs \
	);
	${MAKE} -C ${WRKBUILD}/include
	${MAKE} -C ${WRKBUILD}/progs

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	# this is installed as libncurses - make libcurses a "link"
	rm -f ${WRKINST}/usr/lib/libcurses.so*
	echo 'GROUP(-lncurses)' >${WRKINST}/usr/lib/libcurses.so
	# libcurses will not show up in the IPKG, only in STAGING_DIR
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share/terminfo
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib{form,menu,ncurses,panel}.so* \
	    ${IDIR_LIBNCURSES}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share/terminfo/
	for f in ansi dumb linux screen vt100 vt102 \
	    rxvt-unicode vt220 xterm xterm-color xterm-xfree86; do \
		${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share/terminfo/$${f:0:1}; \
		${INSTALL_DATA} ${WRKINST}/usr/share/terminfo/*/$$f \
		    ${IDIR_LIBNCURSES}/usr/share/terminfo/$${f:0:1}/$$f; \
	done

libncurses-dev-install:
	${INSTALL_DIR} ${IDIR_LIBNCURSES_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBNCURSES_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
