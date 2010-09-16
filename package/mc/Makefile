# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mc
PKG_VERSION:=		4.7.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		f48b2c8dd140aeb36f59d16a662f0779
PKG_DESCR:=		norton commander clone
PKG_SECTION:=		misc
PKG_DEPENDS:=		glib libncurses
PKG_BUILDDEP:=		glib ncurses
PKG_URL:=		http://www.midnight-commander.org/
PKG_SITES:=		http://openadk.org/distfiles/
PKG_NOPARALLEL:=	1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-charset \
			--disable-extcharset \
			--disable-background \
			--disable-gcc-warnings \
			--disable-glibtest \
			--disable-netcode \
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

post-install:
	${INSTALL_DIR} ${IDIR_MC}/etc/mc
	${INSTALL_DIR} ${IDIR_MC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mc ${IDIR_MC}/usr/bin/
	cd ${IDIR_MC}/usr/bin && ln -fs mc mcedit && ln -fs mc mcview
	cd ${WRKINST}/etc/mc && ${CP} cedit.menu mc.ext \
	    mc.lib mc.menu extfs ${IDIR_MC}/etc/mc/

include ${TOPDIR}/mk/pkg-bottom.mk
