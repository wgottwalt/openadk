# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		glib
PKG_VERSION:=		2.27.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		ad9c80adb624a1ffe3d9753bab8a578a
PKG_DESCR:=		low-level core library that forms the basis of GTK+
PKG_SECTION:=		libs
PKG_DEPENDS:=		libintl libiconv libpthread
PKG_BUILDDEP:=		gettext libiconv
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/glib/2.27/

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
			--with-libiconv=gnu \
			--enable-debug=no \
			--with-threads=posix \
	);
	env CFLAGS="-static" LDFLAGS="-static -liconv" ${MAKE} -C ${WRKBUILD}/glib
	env CFLAGS="-static" LDFLAGS="-static" ${MAKE} -C ${WRKBUILD}/gthread
	env CFLAGS="-static" LDFLAGS="-static" ${MAKE} -C ${WRKBUILD}/gio glib-compile-schemas
	env CFLAGS="-static" LDFLAGS="-static" ${MAKE} -C ${WRKBUILD}/gobject glib-genmarshal
	$(CP) ${WRKBUILD}/gio/glib-compile-schemas ${STAGING_HOST_DIR}/bin
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
