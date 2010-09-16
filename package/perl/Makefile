# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		perl
PKG_VERSION:=		5.12.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		af2df531d46b77fdf0d97eecb03eddb2
PKG_DESCR:=		full-blown Perl
PKG_SECTION:=		lang
PKG_URL:=		http://www.perl.org/
PKG_SITES:=		http://www.cpan.org/src/

PKG_CFLINE_PERL:=	depends on ADK_NATIVE

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PERL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

pre-configure:
	(cd ${WRKBUILD}; ./Configure -des -Dcc=gcc -Dprefix=/usr);

post-install:
	${INSTALL_DIR} ${IDIR_PERL}/usr/bin
	${INSTALL_DIR} ${IDIR_PERL}/usr/lib/perl5/${PKG_VERSION}
	${INSTALL_BIN} ${WRKINST}/usr/bin/perl ${IDIR_PERL}/usr/bin/perl

include ${TOPDIR}/mk/pkg-bottom.mk
