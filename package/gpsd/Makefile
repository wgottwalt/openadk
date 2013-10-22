# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gpsd
PKG_VERSION:=		2.95
PKG_RELEASE:=		2
PKG_MD5SUM:=		12535a9ed9fecf9ea2c5bdc9840da5ae
PKG_DESCR:=		An interface daemon for GPS receivers
PKG_SECTION:=		misc
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		ncurses
PKG_SITES:=		http://download.berlios.de/gpsd/
PKG_URL:=		http://gpsd.berlios.de/
PKG_CXX:=		GPSD
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=	!native

PKG_SUBPKGS:=		GPSD GPSD_CLIENTS
PKGSD_GPSD_CLIENTS:=	GPS client utilities

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPSD,gpsd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GPSD_CLIENTS,gpsd-clients,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_GPSD_CLIENTS},${PKG_SECTION}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ENV+=		EGREP="grep -E" \
			CPP="$(TARGET_CC) -E" \
			ac_cv_func_strlcpy=no \
			ac_cv_func_strlcat=no \
			ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--disable-dbus
TARGET_CFLAGS+=		-fPIC

ifeq ($(ADK_COMPILE_GPSD_WITH_UCLIBCXX),y)
LIBRARIES:=-nodefaultlibs -luClibc++ -lgcc -lc
endif

ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
LIBRARIES+=-lssp -lssp_nonshared
endif

ifeq ($(ADK_COMPILE_GPSD_WITH_UCLIBCXX),y)
TARGET_CXXFLAGS+=	-fno-rtti -nostdinc++ \
			-I${STAGING_TARGET_DIR}/usr/include/uClibc++
TARGET_LDFLAGS+=	$(LIBRARIES)
else
TARGET_LDFLAGS+=	-shared -pthread -lstdc++
endif

ifeq (${ADK_COMPILE_GPSD_WITH_UCLIBCXX},y)
# add workaround because libtool tries to link libstdc++
post-configure:
	${SED} 's#postdeps="-lstdc.*#postdeps=""#' \
		${WRKBUILD}/libtool
endif

gpsd-install:
	${INSTALL_DIR} ${IDIR_GPSD}/usr/lib ${IDIR_GPSD}/usr/sbin
	${CP} ${WRKINST}/usr/lib/libgps.so* ${IDIR_GPSD}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgpsd.so* ${IDIR_GPSD}/usr/lib
	${CP} ${WRKINST}/usr/sbin/gpsd ${IDIR_GPSD}/usr/sbin

gpsd-clients-install:
	${INSTALL_DIR} ${IDIR_GPSD_CLIENTS}/usr/bin
	${CP} ${WRKINST}/usr/bin/{cgps,gpxlogger} \
		${IDIR_GPSD_CLIENTS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
