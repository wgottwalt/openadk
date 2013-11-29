# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		microperl
PKG_VERSION:=		5.10.0
PKG_RELEASE:=		3
PKG_MD5SUM:=		d2c39b002ebfd2c3c5dba589365c5a71
PKG_DESCR:=		Perl without operating-specific functions
PKG_SECTION:=		lang
PKG_URL:=		http://www.perl.org/
PKG_SITES:=		ftp://ftp.cpan.org/pub/CPAN/src/5.0/

PKG_ARCH_DEPENDS:=	!avr32 !m68k

DISTFILES:=		perl-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/perl-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MICROPERL,microperl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

MAKE_FLAGS+=		CC="${TARGET_CC}" OPTIMIZE="${TARGET_CFLAGS}"
MAKE_FILE:=		Makefile.micro

pre-configure:
	$(CP) ./files/uconfig.h.$(CPU_ARCH) $(WRKBUILD)/uconfig.h

do-install:
	${INSTALL_DIR} ${IDIR_MICROPERL}/usr/bin
	${INSTALL_DIR} ${IDIR_MICROPERL}/usr/lib/perl5/${PKG_VERSION}
	${INSTALL_BIN} ${WRKBUILD}/microperl ${IDIR_MICROPERL}/usr/bin/perl
	${INSTALL_DATA} ${WRKBUILD}/lib/strict.pm \
		${IDIR_MICROPERL}/usr/lib/perl5/${PKG_VERSION}

include ${TOPDIR}/mk/pkg-bottom.mk
