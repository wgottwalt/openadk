# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		glib
PKG_VERSION:=		2.28.1
PKG_EXTRAVER:=		2.28
PKG_RELEASE:=		1
PKG_MD5SUM:=		9f6e85e1e38490c3956f4415bcd33e6e
PKG_DESCR:=		low-level core library that forms the basis of GTK+
PKG_SECTION:=		libs
PKG_DEPENDS:=		libintl libiconv libpthread
PKG_BUILDDEP:=		gettext libiconv
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/glib/${PKG_EXTRAVER}/

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GLIB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-debug=no \
			--disable-mem-pools \
			--disable-rebuilds \
			--disable-fam \
			--with-libiconv=gnu \
			--with-threads=posix
CONFIGURE_ENV+=		glib_cv_long_long_format=ll \
			glib_cv_stack_grows=no \
			glib_cv_have_strlcpy=no \
			glib_cv_uscore=no \
			ac_cv_func_posix_getpwuid_r=yes \
			ac_cv_func_posix_getgrgid_r=yes

pre-configure:
ifneq ($(OStype),Darwin)
	(cd ${WRKBUILD}; rm -rf config.{cache,status}; \
		./configure --prefix=$(STAGING_HOST_DIR) \
	);
	env CFLAGS="-static" LDFLAGS="-static -liconv" ${MAKE} -C ${WRKBUILD}
	$(CP) ${WRKBUILD}/gio/.libs/glib-compile-schemas ${STAGING_HOST_DIR}/bin
	$(CP) ${WRKBUILD}/gobject/.libs/glib-genmarshal ${STAGING_HOST_DIR}/bin
	${MAKE} -C ${WRKBUILD} clean
endif

post-install:
	${INSTALL_DIR} ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgio*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libglib*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgobject*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgmodule*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgthread*.so* ${IDIR_GLIB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
