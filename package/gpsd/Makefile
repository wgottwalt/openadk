# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gpsd
PKG_VERSION:=		2.37
PKG_RELEASE:=		1
PKG_MD5SUM:=		6c96cc0b2df0279cb7baac1ebc5881d3
PKG_DESCR:=		An interface daemon for GPS receivers
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread
PKG_SITES:=		http://download.berlios.de/gpsd/

PKG_DESCR_1:=		GPS client utilities

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPSD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GPSD_CLIENTS,gpsd-clients,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_1},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--without-x \
			--disable-python
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
XAKE_FLAGS=		CXXLINK="\$$(LINK)"

ifeq ($(ADK_TARGET_LIB_UCLIBCXX),y)
TCXXFLAGS+=		-fno-builtin -fno-rtti -nostdinc++
TLDFLAGS+=		-luClibc++ -lc -lm -nodefaultlibs
else
TLDFLAGS+=		-shared
endif

post-install:
	${INSTALL_DIR} ${IDIR_GPSD}/usr/lib ${IDIR_GPSD}/usr/sbin
	${CP} ${WRKINST}/usr/lib/libgps.so.* ${IDIR_GPSD}/usr/lib
	${CP} ${WRKINST}/usr/sbin/gpsd ${IDIR_GPSD}/usr/sbin
	${INSTALL_DIR} ${IDIR_GPSD_CLIENTS}/usr/bin
	${CP} ${WRKINST}/usr/bin/{cgps,cgpxlogger} ${IDIR_GPSD_CLIENTS}/

include ${TOPDIR}/mk/pkg-bottom.mk
