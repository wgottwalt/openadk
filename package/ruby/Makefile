# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ruby
PKG_VERSION:=		1.9.1-p129
PKG_RELEASE:=		1
PKG_MD5SUM:=		c71f413514ee6341c627be2957023a5c
PKG_DESCR:=		interpreter for the ruby language
PKG_SECTION:=		net
PKG_URL:=		http://www.ruby-lang.org
PKG_SITES:=		ftp://ftp.ruby-lang.org/pub/ruby/1.9/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RUBY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FILE:=		GNUmakefile
XAKE_FLAGS+=		optflags='' debugflags=''
CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-wide-getaddrinfo
CONFIGURE_ENV+=         ac_cv_func_setpgrp_void=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
INSTALL_TARGET:=	install-nodoc

# Enable some ruby extension / options
post-configure:
	#echo "option nodynamic" >> ${WRKBUILD}/ext/Setup
	echo "socket" >> ${WRKBUILD}/ext/Setup

post-install:
	rm -rf ${WRKINST}/usr/lib/site_ruby
	find ${WRKINST}/usr -name "*.h" -delete
	${CP} ${WRKINST}/usr ${IDIR_RUBY}/

include ${TOPDIR}/mk/pkg-bottom.mk
