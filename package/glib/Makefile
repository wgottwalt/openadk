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
PKG_BUILDDEP:=		gettext libiconv dbus
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/glib/${PKG_EXTRAVER}/

PKG_SUBPKGS:=		GLIB GLIB_DEV
PKGSC_GLIB_DEV:=	devel
PKGSD_GLIB_DEV:=	glib headers

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GLIB,glib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,GLIB_DEV,glib-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_GLIB_DEV},${PKGSC_GLIB_DEV},${PKG_OPTS}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
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
ifneq ($(OStype),FreeBSD)
	(cd ${WRKBUILD}; rm -rf config.{cache,status}; \
		CFLAGS="-L/usr/local/lib" ./configure --prefix=$(STAGING_HOST_DIR) \
			--with-libiconv=gnu \
	)
	${MAKE} -C ${WRKBUILD} V=1
	$(CP) ${WRKBUILD}/gio/.libs/glib-compile-schemas ${STAGING_HOST_DIR}/bin
	$(CP) ${WRKBUILD}/gobject/.libs/glib-genmarshal ${STAGING_HOST_DIR}/bin
	$(CP) ${WRKBUILD}/gobject/glib-mkenums ${STAGING_HOST_DIR}/bin
	${MAKE} -C ${WRKBUILD} clean
endif

glib-install:
	${INSTALL_DIR} ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgio*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libglib*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgobject*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgmodule*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgthread*.so* ${IDIR_GLIB}/usr/lib

glib-dev-install:
	${INSTALL_DIR} ${IDIR_GLIB_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_GLIB_DEV}/usr/lib/glib-2.0/include
	${CP} ${WRKINST}/usr/lib/glib-2.0/include/glibconfig.h \
		${IDIR_GLIB_DEV}/usr/lib/glib-2.0/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_GLIB_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_GLIB_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_GLIB_DEV}/usr/lib/pkgconfig
	${INSTALL_DIR} ${IDIR_GLIB_DEV}/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/glib-genmarshal \
		${IDIR_GLIB_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
