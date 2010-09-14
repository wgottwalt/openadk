# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		glib
PKG_VERSION:=		2.22.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		e699a93d62c01e0ee07caef3e11eddd8
PKG_DESCR:=		low-level core library that forms the basis of GTK+
PKG_SECTION:=		libs
PKG_DEPENDS:=		gettext libiconv libpthread
PKG_BUILDDEP:=		gettext libiconv
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		ftp://ftp.gtk.org/pub/glib/2.22/

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GLIB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-debug=no \
			--disable-mem-pools \
			--disable-rebuilds \
			--with-libiconv=gnu \
			--disable-fam \
			--with-threads=posix
CONFIGURE_ENV+=		glib_cv_long_long_format=ll \
			glib_cv_stack_grows=no \
			glib_cv_have_strlcpy=no \
			glib_cv_uscore=no \
			ac_cv_func_posix_getpwuid_r=yes \
			ac_cv_func_posix_getgrgid_r=yes

post-install:
	${INSTALL_DIR} ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgio*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libglib*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgobject*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgmodule*.so* ${IDIR_GLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgthread*.so* ${IDIR_GLIB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
