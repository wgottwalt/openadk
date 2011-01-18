# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gpsd
PKG_VERSION:=		2.95
PKG_RELEASE:=		1
PKG_MD5SUM:=		12535a9ed9fecf9ea2c5bdc9840da5ae
PKG_DESCR:=		An interface daemon for GPS receivers
PKG_SECTION:=		misc
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		ncurses
PKG_SITES:=		http://download.berlios.de/gpsd/
PKG_URL:=		http://gpsd.berlios.de/
PKG_CXX:=		GPSD
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		GPSD GPSD_CLIENTS
PKGSD_GPSD_CLIENTS:=	GPS client utilities

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPSD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GPSD_CLIENTS,gpsd-clients,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_GPSD_CLIENTS},${PKG_SECTION}))

CONFIGURE_ENV+=		EGREP="grep -E" \
			CPP="$(TARGET_CC) -E" \
			ac_cv_func_strlcpy=no \
			ac_cv_func_strlcat=no \
			ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--disable-dbus
TCFLAGS+=		-fPIC

LIBRARIES:=-nodefaultlibs -luClibc++
ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
LIBRARIES+=-lssp -lssp_nonshared
endif

ifeq ($(ADK_COMPILE_GPSD_WITH_UCLIBCXX),y)
TCXXFLAGS+=		-fno-rtti -nostdinc++ \
			-I${STAGING_TARGET_DIR}/usr/include/uClibc++
TLDFLAGS+=		$(LIBRARIES)
else
TLDFLAGS+=		-shared -pthread
endif

ifeq (${ADK_COMPILE_GPSD_WITH_UCLIBCXX},y)
# add workaround because libtool tries to link libstdc++
post-configure:
	${SED} 's#postdeps="-lstdc.*#postdeps=""#' \
		${WRKBUILD}/libtool
endif

post-install:
	${INSTALL_DIR} ${IDIR_GPSD}/usr/lib ${IDIR_GPSD}/usr/sbin
	${CP} ${WRKINST}/usr/lib/libgps.so* ${IDIR_GPSD}/usr/lib
	${CP} ${WRKINST}/usr/sbin/gpsd ${IDIR_GPSD}/usr/sbin
	${INSTALL_DIR} ${IDIR_GPSD_CLIENTS}/usr/bin
	${CP} ${WRKINST}/usr/bin/{cgps,gpxlogger} \
		${IDIR_GPSD_CLIENTS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
