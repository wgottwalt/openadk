# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libiconv
PKG_VERSION:=		1.13.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		7ab33ebd26687c744a37264a330bbe9a
PKG_DESCR:=		character set conversion library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnu.org/software/libiconv/
PKG_SITES:=		${MASTER_SITE_GNU:=libiconv/}
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBICONV,libiconv,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
TARGET_CFLAGS+=		-fPIC
FAKE_FLAGS+=		libdir="${WRKINST}/usr/lib" \
			includedir="${WRKINST}/usr/include" \
INSTALL_TARGET=		install-lib

libiconv-install:
	${INSTALL_DIR} ${IDIR_LIBICONV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libiconv.so* ${IDIR_LIBICONV}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
