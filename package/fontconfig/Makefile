# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		fontconfig
PKG_VERSION:=		2.12.1
PKG_RELEASE:=		1
PKG_HASH:=		a9f42d03949f948a3a4f762287dbc16e53a927c91a07ee64207ebd90a9e5e292
PKG_DESCR:=		library for configuring and customizing font access
PKG_SECTION:=		libs/fonts
PKG_DEPENDS:=		libxml2
PKG_BUILDDEP:=		freetype libxml2
HOST_BUILDDEP:=		expat-host
PKG_URL:=		http://fontconfig.org/
PKG_SITES:=		http://fontconfig.org/release/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,FONTCONFIG,fontconfig,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,FONTCONFIG,fontconfig,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--with-arch=${ADK_TARGET_ARCH} \
			--enable-libxml2 \
			--disable-docs

fontconfig-install:
	${INSTALL_DIR} ${IDIR_FONTCONFIG}/usr/lib ${IDIR_FONTCONFIG}/etc/fonts
	${CP} ${WRKINST}/usr/lib/libfontconfig.so* ${IDIR_FONTCONFIG}/usr/lib
	$(CP) ${WRKINST}/etc/fonts/* ${IDIR_FONTCONFIG}/etc/fonts

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
