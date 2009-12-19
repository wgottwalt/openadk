# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		gettext
PKG_VERSION=		0.16.1
PKG_RELEASE=		1
PKG_BUILDDEP+=		libiconv libpthread
PKG_MD5SUM=		3d9ad24301c6d6b17ec30704a13fe127
PKG_DESCR:=		internationalisation library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libiconv libpthread
PKG_URL:=		http://www.gnu.org/software/gettext/
PKG_SITES:=		${MASTER_SITE_GNU:=gettext/}
ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}/gettext-runtime

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GETTEXT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-java \
			--disable-native-java \
			--disable-csharp \
			--enable-nls \
			--disable-libasprintf \
			--enable-threads=posix \
			--disable-openmp \
			--with-libiconv-prefix='${STAGING_DIR}/usr' \
			--with-included-gettext \
			--without-emacs
CONFIGURE_ENV+=		nls_cv_use_gnu_gettext=yes \
			ac_cv_gnu_library_2=no \
			gt_use_preinstalled_gnugettext=no
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_GETTEXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/*.so.* ${IDIR_GETTEXT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
