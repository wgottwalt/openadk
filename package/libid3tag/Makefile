# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libid3tag
PKG_VERSION:=		0.15.1b
PKG_RELEASE:=		1
PKG_MD5SUM:=		e5808ad997ba32c498803822078748c3
PKG_DESCR:=		an ID3 tag manipulation library
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mad/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBID3TAG,libid3tag,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-debugging \
			--disable-profiling

pre-install:
	${INSTALL_DIR} ${WRKINST}/usr/lib/pkgconfig
	${CP} ./files/id3tag.pc ${WRKINST}/usr/lib/pkgconfig

post-install:
	${INSTALL_DIR} ${IDIR_LIBID3TAG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libid3tag.so.* ${IDIR_LIBID3TAG}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
