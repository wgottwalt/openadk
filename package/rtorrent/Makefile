# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rtorrent
PKG_VERSION:=		0.8.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		a2456182e1767e5aed7341dbbd058f60
PKG_DESCR:=		console torrent application
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses libtorrent libcurl
PKG_URL:=		http://libtorrent.rakshasa.no
PKG_SITES:=		http://libtorrent.rakshasa.no/downloads/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RTORRENT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_COMPILE_RTORRENT_WITH_UCLIBCXX),y)
CONFIGURE_ENV+=		CXXFLAGS="-fno-builtin -fno-rtti -nostdinc++ \
			-I${STAGING_DIR}/usr/include/uClibc++" \
			LIBS="-nodefaultlibs -luClibc++ -lc -lm -lgcc"
endif

CONFIGURE_STYLE:=	autotool gnu
CONFIGURE_ARGS+=	--enable-aligned
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_RTORRENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rtorrent ${IDIR_RTORRENT}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
