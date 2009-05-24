# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		vim
PKG_VERSION=		7.2
PKG_RELEASE=		1
PKG_MD5SUM=		f0901284b338e448bfd79ccca0041254
PKG_PARALLEL:=		1
MASTER_SITES=		ftp://ftp.vim.org/pub/vim/unix/
DISTFILES=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
WRKDIST=		${WRKDIR}/vim72
WRKSRC=			${WRKDIST}/src

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VIM,vim,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		vim_cv_toupper_broken=no \
			vim_cv_getcwd_broken=no \
			vim_cv_stat_ignores_slash=yes \
			ac_cv_sizeof_int=4 \
			vim_cv_terminfo=yes \
			vim_cv_tty_group=tty \
			vim_cv_memmove_handles_overlap=yes \
			vim_cv_tty_mode=666
CONFIGURE_ARGS+=	--disable-darwin \
			--disable-xsmp \
			--disable-mzschemeinterp \
			--disable-perlinterp \
			--disable-pythoninterp \
			--disable-tclinterp \
			--disable-rubyinterp \
			--disable-cscope \
			--disable-workshop \
			--disable-netbeans \
			--disable-sniff \
			--disable-hangulinput \
			--disable-xim \
			--disable-fontset \
			--disable-gui \
			--disable-acl \
			--disable-gpm \
			--disable-nls \
			--with-features=tiny \
			--with-compiledby=OpenADK \
			--without-x \
			--with-tlib=ncurses \
			--disable-multibyte
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
XAKE_FLAGS+=		prefix=/usr \
			DESTDIR=${WRKINST} \
			STRIP=:

post-install:
	${INSTALL_DIR} ${IDIR_VIM}/usr/bin
	${CP} ${WRKINST}/usr/bin/{ex,vim,view} ${IDIR_VIM}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
