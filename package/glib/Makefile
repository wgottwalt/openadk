# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		glib
PKG_VERSION:=		2.40.0
PKG_RELEASE:=		4
PKG_EXTRAVER:=		2.40
PKG_MD5SUM:=		05fb7cb17eacbc718e90366a1eae60d9
PKG_DESCR:=		low-level core library that forms the basis of gtk+
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		glib-host libffi gettext-tiny zlib libelf dbus
HOST_BUILDDEP:=		libffi-host gettext-tiny-host python2-host
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/glib/${PKG_EXTRAVER}/
PKG_NOPARALLEL:=	1
PKG_OPTS:=		dev noscripts

PKG_BUILDDEP_UCLIBC:=	libiconv-tiny
PKG_BUILDDEP_UCLIBC_NG:=libiconv-tiny

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

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
			--with-libiconv=no \
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

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
