# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libao
PKG_VERSION:=		0.8.8
PKG_RELEASE:=		3
PKG_MD5SUM:=		b92cba3cbcf1ee9bc221118a85d23dcd
PKG_DESCR:=		A cross platform audio library
PKG_SECTION:=		libs
PKG_DEPENDS:=		esound
PKG_BUILDDEP:=		esound
PKG_URL:=		http://www.xiph.org/ao
PKG_SITES:=		http://downloads.xiph.org/releases/ao/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAO,libao,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-esd \
			--disable-arts \
			--disable-nas \
			--disable-polyp

libao-install:
	${INSTALL_DIR} ${IDIR_LIBAO}/usr/lib/ao/plugins-2
	${CP} ${WRKINST}/usr/lib/libao.so* ${IDIR_LIBAO}/usr/lib/
	${CP} ${WRKINST}/usr/lib/ao/plugins-2/*.so \
		${IDIR_LIBAO}/usr/lib/ao/plugins-2

include ${TOPDIR}/mk/pkg-bottom.mk
