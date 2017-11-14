# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		pigpio
PKG_VERSION:=		1aa4cca8a69d4f8f8ce198178dbd7f436b4f503c
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_HASH:=		9d48aa27bb8c9721f5e78f234834ee447934d9a21aeb0a58f123c7be0bb90126
PKG_DESCR:=		IO library for the raspberry PI
PKG_SECTION:=		libs/misc
PKG_NEEDS:=		c++
PKG_URL:=		http://joan2937.github.io/pigpio/
PKG_SITES:=		https://github.com/joan2937/pigpio.git

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PIGPIO,pigpio,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

post-build:
	$(INSTALL_DIR) ${WRKINST}/usr/include/pigpio
	$(CP) ${WRKBUILD}/pigpio.h \
		${WRKINST}/usr/include/pigpio
	$(INSTALL_DIR) ${WRKINST}/usr/lib
	$(CP) ${WRKBUILD}/libpigpio.so \
		${WRKINST}/usr/lib

do-build:
	cd $(WRKBUILD) && CROSS_PREFIX=${TARGET_CROSS} DESTDIR=$(WRKINST) prefix=${WRKINST}/usr ${MAKE}
	
do-install:
	${INSTALL_DIR} ${IDIR_PIGPIO}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpigpio.so ${IDIR_PIGPIO}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
