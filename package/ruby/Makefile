# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# == Doc
# * http://wiki.rubygarden.org/Ruby/page/show/RubyOnUCLinux

include ${TOPDIR}/rules.mk

PKG_NAME:=		ruby
PKG_VERSION:=		1.8.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		de906850f9a012c12ffc6e9f56fb1b66
MASTER_SITES:=		http://ftp.ruby-lang.org/pub/ruby/stable/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RUBY,ruby,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=         ac_cv_func_setpgrp_void=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

# Enable some ruby extension / options
post-configure:
	echo "option nodynamic" >> ${WRKBUILD}/ext/Setup
	echo "socket" >> ${WRKBUILD}/ext/Setup

# Remove the /usr/lib/libruby.so and keep the static (~1M) ?
post-install:
	rm -rf ${WRKINST}/usr/lib/site_ruby
	find ${WRKINST}/usr -name "*.h" -delete
	cp -a ${WRKINST}/usr ${IDIR_RUBY}

include ${TOPDIR}/mk/pkg-bottom.mk

