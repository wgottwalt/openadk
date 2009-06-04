# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		mc
PKG_VERSION=		4.6.1
PKG_RELEASE=		1
PKG_MD5SUM=		18b20db6e40480a53bac2870c56fc3c4
PKG_DESCR:=		norton commander clone
PKG_SECTION:=		misc
PKG_DEPENDS:=		libncurses glib
PKG_URL:=		http://www.midnight-commander.org
PKG_SITES=		http://www.ibiblio.org/pub/Linux/utils/file/managers/mc/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MC,mc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-charset \
			--disable-background \
			--disable-gcc-warnings \
			--disable-glibtest \
			--without-libiconv-prefix \
			--without-x \
			--with-vfs \
			--without-mcfs \
			--without-samba \
			--without-gpm-mouse \
			--with-configdir=/etc \
			--without-ext2undel \
			--with-subshell \
			--with-screen=ncurses \
			--with-edit
CONFIGURE_ENV+=		mc_cv_have_zipinfo=yes \
			am_cv_func_iconv=no
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

pre-install:
	cp ${WRKSRC}/doc/xnc.hlp ${WRKSRC}/doc/mc.hlp

post-install:
	${INSTALL_DIR} ${IDIR_MC}/usr/{bin,share/mc}
	${CP} ${WRKINST}/usr/bin/mc ${IDIR_MC}/usr/bin/
	cd ${IDIR_MC}/usr/bin && ln -s mc mcedit && ln -s mc mcview
	cd ${WRKINST}/usr/share/mc && ${CP} cedit.menu mc.ext mc.hint \
	    mc.lib mc.menu syntax extfs ${IDIR_MC}/usr/share/mc/

include ${TOPDIR}/mk/pkg-bottom.mk
