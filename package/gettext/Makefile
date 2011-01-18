# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		gettext
PKG_VERSION=		0.18.1.1
PKG_RELEASE=		1
PKG_MD5SUM:=		3dd55b952826d2b32f51308f2f91aa89
PKG_DESCR:=		internationalisation library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libiconv libpthread
PKG_BUILDDEP:=		libiconv libpthread
PKG_URL:=		http://www.gnu.org/software/gettext/
PKG_SITES:=		${MASTER_SITE_GNU:=gettext/}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

WRKSRC=			${WRKDIR}/${PKG_NAME}-${PKG_VERSION}/gettext-runtime

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GETTEXT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-java \
			--disable-native-java \
			--disable-csharp \
			--enable-nls \
			--disable-libasprintf \
			--disable-rpath \
			--enable-threads=posix \
			--disable-openmp \
			--with-libiconv-prefix='${STAGING_TARGET_DIR}/usr' \
			--with-included-gettext \
			--without-emacs
CONFIGURE_ENV+=		nls_cv_use_gnu_gettext=yes \
			ac_cv_gnu_library_2=no \
			gt_use_preinstalled_gnugettext=no

post-install:
	${INSTALL_DIR} ${IDIR_GETTEXT}/usr/lib ${IDIR_GETTEXT}/usr/bin
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_GETTEXT}/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/bin/gettext \
		$(IDIR_GETTEXT)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
