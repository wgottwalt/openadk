# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		gettext
PKG_VERSION=		0.18.1.1
PKG_RELEASE=		2
PKG_MD5SUM:=		3dd55b952826d2b32f51308f2f91aa89
PKG_DESCR:=		internationalisation library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libiconv
PKG_DEPENDS:=		libiconv libpthread
PKG_URL:=		http://www.gnu.org/software/gettext/
PKG_SITES:=		${MASTER_SITE_GNU:=gettext/}

PKG_SUBPKGS:=		LIBINTL LIBINTL_DEV GETTEXT MSGFMT
PKGSD_LIBINTL_DEV:=	libintl headers
PKGSC_LIBINTL_DEV:=	devel
PKGSD_GETTEXT:=		gettext utility
PKGSC_GETTEXT:=		misc
PKGSS_GETTEXT:=		libintl
PKGSD_MSGFMT:=		msgfmt utility
PKGSC_MSGFMT:=		misc
PKGSS_MSGFMT:=		libintl

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBINTL,libintl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBINTL_DEV,libintl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBINTL_DEV:},${PKGSC_LIBINTL_DEV},${PKG_OPTS}))
$(eval $(call PKG_template,GETTEXT,gettext,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_GETTEXT},${PKGSD_GETTEXT},${PKGSC_GETTEXT}))
$(eval $(call PKG_template,MSGFMT,msgfmt,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_MSGFMT},${PKGSD_MSGFMT},${PKGSC_MSGFMT}))

CONFIGURE_ARGS+=	--disable-java \
			--disable-native-java \
			--disable-csharp \
			--disable-libasprintf \
			--disable-rpath \
			--enable-threads=posix \
			--enable-nls \
			--disable-openmp \
			--with-libiconv-prefix='${STAGING_TARGET_DIR}/usr' \
			--with-included-gettext \
			--without-emacs
CONFIGURE_ENV+=		nls_cv_use_gnu_gettext=yes \
			ac_cv_gnu_library_2=no \
			gt_use_preinstalled_gnugettext=no

INSTALL_STYLE:=		manual

libintl-install:
	${INSTALL_DIR} ${IDIR_LIBINTL}/usr/lib
	${CP} ${WRKBUILD}/gettext-runtime/intl/.libs/libintl.so* \
		${IDIR_LIBINTL}/usr/lib

libintl-dev-install:
	${INSTALL_DIR} ${IDIR_LIBINTL_DEV}/usr/include
	${INSTALL_DATA} ${WRKBUILD}/gettext-runtime/intl/libintl.h \
		${IDIR_LIBINTL_DEV}/usr/include

gettext-install:
	${INSTALL_DIR} ${IDIR_GETTEXT}/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/gettext-runtime/src/.libs/gettext \
		$(IDIR_GETTEXT)/usr/bin

msgfmt-install:
	${INSTALL_DIR} ${IDIR_MSGFMT}/usr/bin
	${INSTALL_DIR} ${IDIR_MSGFMT}/usr/lib
	${CP} ${WRKBUILD}/gettext-tools/libgettextpo/.libs/libgettextpo.so* \
		${IDIR_MSGFMT}/usr/lib
	${CP} ${WRKBUILD}/gettext-tools/gnulib-lib/.libs/libgettextlib*so* \
		${IDIR_MSGFMT}/usr/lib
	${CP} ${WRKBUILD}/gettext-tools/src/.libs/libgettextsrc*so* \
		${IDIR_MSGFMT}/usr/lib
	$(INSTALL_BIN) $(WRKBUILD)/gettext-tools/src/.libs/msgfmt \
		$(IDIR_MSGFMT)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
