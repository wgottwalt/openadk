# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		glib
PKG_VERSION:=		2.38.2
PKG_RELEASE:=		3
PKG_EXTRAVER:=		2.38
PKG_MD5SUM:=		26d1d08e478fc48c181ca8be44f5b69f
PKG_DESCR:=		low-level core library that forms the basis of GTK+
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		glib-host libffi gettext-tiny libiconv-tiny zlib libelf dbus
HOST_BUILDDEP:=		libffi-host gettext-tiny-host libiconv-tiny-host
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/glib/${PKG_EXTRAVER}/
PKG_NOPARALLEL:=	1
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,GLIB,glib,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,GLIB,glib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE
CONFIGURE_ARGS+=	--disable-mem-pools \
			--disable-rebuilds \
			--disable-fam \
			--with-threads=posix
CONFIGURE_ENV+=		glib_cv_long_long_format=ll \
			glib_cv_stack_grows=no \
			glib_cv_have_strlcpy=no \
			glib_cv_uscore=no \
			ac_cv_func_posix_getpwuid_r=yes \
			ac_cv_func_posix_getgrgid_r=yes

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--disable-fam \
			--enable-static \
			--disable-compile-warnings

glib-install:
	${INSTALL_DIR} ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgio*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libglib*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgobject*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgmodule*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgthread*.so* ${IDIR_GLIB}/usr/lib
	# workaround for dev subpackage
	${INSTALL_DIR} ${IDIR_GLIB_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_GLIB_DEV}/usr/lib/glib-2.0/include
	${CP} ${WRKINST}/usr/lib/glib-2.0/include/glibconfig.h \
		${IDIR_GLIB_DEV}/usr/lib/glib-2.0/include
	${INSTALL_DIR} ${IDIR_GLIB_DEV}/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/glib-genmarshal \
		${IDIR_GLIB_DEV}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
