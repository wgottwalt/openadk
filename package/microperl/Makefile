# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		microperl
PKG_VERSION:=		5.10.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		d2c39b002ebfd2c3c5dba589365c5a71
PKG_DESCR:=		Perl without operating-specific functions
PKG_SECTION:=		net
PKG_URL:=		www.perl.org
PKG_SITES:=		ftp://ftp.cpan.org/pub/CPAN/src/5.0/ \
			ftp://ftp.mpi-sb.mpg.de/pub/perl/CPAN/src/5.0/ \
			ftp://ftp.gmd.de/mirrors/CPAN/src/5.0/ \
			ftp://ftp.funet.fi/pub/languages/perl/CPAN/src/5.0/

DISTFILES:=		perl-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/perl-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MICROPERL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" OPTIMIZE="${TCFLAGS}"
MAKE_FILE:=		Makefile.micro

pre-configure:
	$(CP) ./files/uconfig.h.$(CPU_ARCH) $(WRKBUILD)/uconfig.h

do-install:
	${INSTALL_DIR} ${IDIR_MICROPERL}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/microperl ${IDIR_MICROPERL}/usr/bin/perl

include ${TOPDIR}/mk/pkg-bottom.mk
