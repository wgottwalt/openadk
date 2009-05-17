# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		microperl
PKG_VERSION:=		5.8.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		8d4aa4e061fd5bc0c39e4f0a63267880
MASTER_SITES:=		ftp://ftp.cpan.org/pub/CPAN/src/5.0/ \
			ftp://ftp.mpi-sb.mpg.de/pub/perl/CPAN/src/5.0/ \
			ftp://ftp.gmd.de/mirrors/CPAN/src/5.0/ \
			ftp://ftp.funet.fi/pub/languages/perl/CPAN/src/5.0/
DISTFILES:=		perl-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/perl-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MICROPERL,microperl,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" OPTIMIZE="${TCFLAGS}"
MAKE_FILE:=		Makefile.micro

do-install:
	${INSTALL_DIR} ${IDIR_MICROPERL}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/microperl ${IDIR_MICROPERL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
