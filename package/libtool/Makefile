# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtool
PKG_VERSION:=		2.4.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		2ec8997e0c07249eb4cbd072417d70fe
PKG_DESCR:=		generic dynamic object loading library
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host libtool-host
PKG_URL:=		http://www.gnu.org/software/libtool/
PKG_SITES:=		${MASTER_SITE_GNU:=libtool/}
PKG_LIBNAME:=		libltdl
PKG_OPTS:=		dev

PKG_SUBPKGS:=		LIBTOOL LIBLTDL
PKGSC_LIBLTDL:=		libs/misc

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBTOOL,libtool,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBTOOL,libtool,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBLTDL,libltdl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_LIBLTDL},${PKG_OPTS}))

ifeq (${ADK_HOST_OPENBSD},y)
XAKE_FLAGS+=		AUTOCONF_VERSION=2.62
endif

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--enable-ltdl-install
XAKE_FLAGS+=		HELP2MAN=/bin/echo
HOST_XAKE_FLAGS+=	HELP2MAN=/bin/echo

libtool-install:
	${INSTALL_DIR} ${IDIR_LIBTOOL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libtool ${IDIR_LIBTOOL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libtoolize ${IDIR_LIBTOOL}/usr/bin

libltdl-install:
	${INSTALL_DIR} ${IDIR_LIBLTDL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libltdl.so* ${IDIR_LIBLTDL}/usr/lib/

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
