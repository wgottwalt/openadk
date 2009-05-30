# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gnupg
PKG_VERSION:=		1.4.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		3537dedea45cc09e8d88d1ef4f774246
PKG_DESCR:=		Gnu Privacy Guard
PKG_SECTION:=		text
PKG_DEPENDS:=		libreadline
PKG_URL:=		http://www.gnu.org
PKG_SITES:=		ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/gnupg/ \
			ftp://ftp.gnupg.org/gcrypt/gnupg/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPG,gpg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_c_bigendian=no \
			ac_cv_sizeof_off_t=8
CONFIGURE_ARGS+=	--disable-asm \
			--disable-gnupg-iconv \
			--disable-card-support \
			--disable-agent-support \
			--disable-bzip2 \
			--disable-exec \
			--disable-ldap \
			--disable-hkp \
			--disable-finger \
			--disable-ftp \
			--disable-dns-srv \
			--enable-fake-curl \
			--disable-regex
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_GPG}/usr/bin/
	${INSTALL_BIN} ${WRKBUILD}/g10/gpg ${IDIR_GPG}/usr/bin/
# we need root privileges for secure memory (locked pages)
	chmod u+s ${IDIR_GPG}/usr/bin/gpg

include ${TOPDIR}/mk/pkg-bottom.mk
