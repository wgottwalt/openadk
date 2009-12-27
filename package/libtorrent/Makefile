# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtorrent
PKG_VERSION:=		0.12.5
PKG_RELEASE:=		1
PKG_BUILDDEP+=		openssl libsigc++
PKG_MD5SUM:=		fe8155d364b220713074423100d4bf29
PKG_DESCR:=		A bittorrent library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libopenssl libsigc++
PKG_URL:=		http://libtorrent.rakshasa.no
PKG_SITES:=		http://libtorrent.rakshasa.no/downloads/
#PKG_CXX:=		LIBTORRENT

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTORRENT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

#ifeq ($(ADK_COMPILE_LIBTORRENT_WITH_UCLIBCXX),y)
#CONFIGURE_ENV+=		CXXFLAGS="-fno-builtin -fno-rtti -nostdinc++ -fno-strict-aliasing -fno-inline \
#			-I${STAGING_DIR}/usr/include/uClibc++" \
#			LIBS="-nodefaultlibs -luClibc++ -lc -lm -lgcc"
#endif

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-aligned
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

#ifeq (${ADK_COMPILE_LIBTORRENT_WITH_UCLIBCXX},y)
# add workaround because libtool tries to link libstdc++
#post-configure:
#	${SED} 's#postdeps="-lstdc.*#postdeps=""#' \
#		${WRKBUILD}/libtool
#endif

post-install:
	${INSTALL_DIR} ${IDIR_LIBTORRENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtorrent.so.* ${IDIR_LIBTORRENT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
