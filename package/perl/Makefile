# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		perl
PKG_VERSION:=		5.12.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		29975a69dce54e47fcd6331c085c6c99
PKG_DESCR:=		full-blown Perl
PKG_SECTION:=		lang
PKG_URL:=		http://www.perl.org/
PKG_SITES:=		http://www.cpan.org/src/

PKG_ARCH_DEPENDS:=	native

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PERL,perl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

pre-configure:
	(cd ${WRKBUILD}; ./Configure -des -Dusethreads -Dcc=gcc -Dprefix=/usr -A ccflags="${TARGET_CFLAGS}");

perl-install:
	${INSTALL_DIR} ${IDIR_PERL}/usr/bin
	${INSTALL_DIR} ${IDIR_PERL}/usr/lib/perl5/${PKG_VERSION}
	${CP} ${WRKINST}/usr/lib/perl5/${PKG_VERSION}/* \
		${IDIR_PERL}/usr/lib/perl5/${PKG_VERSION}
	${INSTALL_BIN} ${WRKINST}/usr/bin/perl ${IDIR_PERL}/usr/bin/perl

include ${TOPDIR}/mk/pkg-bottom.mk
