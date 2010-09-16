# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		screen
PKG_VERSION:=		4.0.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		8506fd205028a96c741e4037de6e3c42
PKG_DESCR:=		A window manager for the terminal session
PKG_SECTION:=		misc
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.gnu.org/software/screen/
PKG_SITES:=		${MASTER_SITE_GNU:=screen/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SCREEN,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		$(foreach flag,rename fchmod fchown strerror lstat _exit utimes vsnprintf getcwd setlocale strftime,ac_cv_func_${flag}=yes)
CONFIGURE_ARGS+=	--with-sys-screenrc=/etc/screenrc

post-install:
	${INSTALL_DIR} ${IDIR_SCREEN}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/screen ${IDIR_SCREEN}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
