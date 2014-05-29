# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mc
PKG_VERSION:=		4.8.12
PKG_RELEASE:=		2
PKG_MD5SUM:=		7ecccc03df060cd0ca1414a5a14e6649
PKG_DESCR:=		norton commander clone
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		glib libncurses libssh2
PKG_BUILDDEP:=		glib ncurses libssh2
PKG_URL:=		http://www.midnight-commander.org/
PKG_SITES:=		http://ftp.midnight-commander.org/
PKG_NOPARALLEL:=	1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MC,mc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ARGS+=	--enable-charset \
			--disable-extcharset \
			--disable-background \
			--disable-gcc-warnings \
			--disable-glibtest \
			--disable-netcode \
			--without-libiconv-prefix \
			--without-x \
			--enable-vfs \
			--enable-vfs-sftp \
			--with-mcfs \
			--without-samba \
			--without-gpm-mouse \
			--with-configdir=/etc \
			--without-ext2undel \
			--with-subshell \
			--with-screen=ncurses \
			--with-edit
CONFIGURE_ENV+=		mc_cv_have_zipinfo=yes \
			am_cv_func_iconv=no

mc-install:
	${INSTALL_DIR} ${IDIR_MC}/etc/mc
	${INSTALL_DIR} ${IDIR_MC}/usr/bin
	${INSTALL_DIR} ${IDIR_MC}/usr/share/mc
	${CP} ${WRKINST}/usr/share/mc/* ${IDIR_MC}/usr/share/mc
	${INSTALL_BIN} ${WRKINST}/usr/bin/mc ${IDIR_MC}/usr/bin/
	cd ${IDIR_MC}/usr/bin && ln -fs mc mcedit && ln -fs mc mcview
	cd ${WRKINST}/etc/mc && ${CP} mcedit.menu mc.ext sfs.ini \
	    mc.menu ${IDIR_MC}/etc/mc/

include ${TOPDIR}/mk/pkg-bottom.mk
