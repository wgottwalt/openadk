# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fontconfig
PKG_VERSION:=		2.10.91
PKG_RELEASE:=		1
PKG_MD5SUM:=		0a8edc63aa79377b2bf44e469d5bbbb7
PKG_DESCR:=		library for configuring and customizing font access
PKG_SECTION:=		libs
PKG_DEPENDS:=		libxml2 libiconv
PKG_BUILDDEP:=		freetype libxml2 libiconv
PKG_URL:=		http://fontconfig.org/
PKG_SITES:=		http://fontconfig.org/release/

PKG_SUBPKGS:=		FONTCONFIG FONTCONFIG_DEV
PKGSD_FONTCONFIG_DEV:=	configuring and customizing font access headers
PKGSC_FONTCONFIG_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FONTCONFIG,fontconfig,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,FONTCONFIG_DEV,fontconfig-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FONTCONFIG_DEV},${PKGSC_FONTCONFIG_DEV},${PKG_OPTS}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
TARGET_LDFLAGS+=	-liconv
CONFIGURE_ARGS+=	--with-arch=${ARCH} \
			--disable-docs

fontconfig-install:
	${INSTALL_DIR} ${IDIR_FONTCONFIG}/usr/lib ${IDIR_FONTCONFIG}/etc/fonts
	${CP} ${WRKINST}/usr/lib/libfontconfig.so* ${IDIR_FONTCONFIG}/usr/lib
	$(CP) ${WRKINST}/etc/fonts/* ${IDIR_FONTCONFIG}/etc/fonts

fontconfig-dev-install:
	${INSTALL_DIR} ${IDIR_FONTCONFIG_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/fontconfig.pc \
		${IDIR_FONTCONFIG_DEV}/usr/lib/pkgconfig
	${INSTALL_DIR} ${IDIR_FONTCONFIG_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_FONTCONFIG_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
