# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		glib
PKG_VERSION:=		1.2.10
PKG_RELEASE:=		2
PKG_MD5SUM:=		6fe30dad87c77b91b632def29dd69ef9
MASTER_SITES:=		ftp://ftp.gtk.org/pub/gtk/v1.2/ \
			http://ftp.gwdg.de/pub/misc/grafik/gimp/gtk/v1.2/ \
			http://ftp.esat.net/mirrors/ftp.gimp.org/pub/gtk/v1.2/ \
			http://www.mirrorservice.org/sites/ftp.gimp.org/pub/gtk/v1.2/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GLIB1,glib1,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		glib_cv_sizeof_gmutex=24 \
			ac_cv_sizeof_char=1 \
			ac_cv_sizeof_short=2 \
			ac_cv_sizeof_int=4 \
			ac_cv_sizeof_long=4 \
			ac_cv_sizeof_long_long=8 \
			ac_cv_sizeof_void_p=4 \
			glib_cv_prog_cc_ansi_proto="no" \
			glib_cv_has__inline="yes" \
			glib_cv_has__inline__="yes" \
			glib_cv_hasinline="yes" \
			glib_cv_sane_realloc="yes" \
			glib_cv_va_copy="no" \
			glib_cv___va_copy="yes" \
			glib_cv_va_val_copy="yes" \
			glib_cv_rtldglobal_broken="no" \
			glib_cv_uscore="no" \
			ac_cv_func_getpwuid_r="yes" \
			glib_cv_func_pthread_mutex_trylock_posix="yes" \
			glib_cv_func_pthread_cond_timedwait_posix="yes" \
			glib_cv_sizeof_gmutex="24" \
			glib_cv_byte_contents_gmutex="0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_GLIB1}/usr/lib
	${CP} ${WRKINST}/usr/lib/libg{lib,module,thread}-1.2.so.* \
		${IDIR_GLIB1}/usr/lib/
	# needed in staging_dir
	${INSTALL_DIR} ${WRKINST}/usr/include/glib-1.2
	${CP} ${WRKBUILD}/glibconfig-sysdefs.h ${WRKINST}/usr/include/glib-1.2/

include ${TOPDIR}/mk/pkg-bottom.mk
