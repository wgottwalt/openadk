# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		glib2
PKG_VERSION=		2.18.1
PKG_RELEASE=		1
PKG_MD5SUM=		d53836f7fdd9970d03e255e9d712bd83
DISTFILES=		glib-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/glib-${PKG_VERSION}
MASTER_SITES=		ftp://ftp.gtk.org/pub/glib/2.18/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GLIB2,glib2,${PKG_VERSION}-${PKG_RELEASE}))

TCPPFLAGS+=		-I'${STAGING_DIR}/usr/include'
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--enable-debug=no \
			--disable-mem-pools \
			--disable-rebuilds \
			--with-libiconv=gnu \
			--with-threads=posix
CONFIGURE_ENV+=		glib_cv_long_long_format=ll \
			glib_cv_stack_grows=no \
			glib_cv_have_strlcpy=no \
			glib_cv_uscore=no \
			ac_cv_func_posix_getpwuid_r=yes \
			ac_cv_func_posix_getgrgid_r=yes
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_GLIB2}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib*.so.* ${IDIR_GLIB2}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
