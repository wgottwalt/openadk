# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gnupg
PKG_VERSION:=		1.4.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		991faf66d3352ac1452acc393c430b23
PKG_DESCR:=		gnu privacy guard
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libreadline
PKG_BUILDDEP:=		readline libiconv-tiny
PKG_URL:=		http://www.gnupg.org/
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/gnupg/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
 
include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GNUPG,gnupg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
			--disable-rpath \
			--enable-fake-curl \
			--disable-regex

gnupg-install:
	${INSTALL_DIR} ${IDIR_GNUPG}/usr/bin/
	${INSTALL_DIR} ${IDIR_GNUPG}/usr/share/gnupg
	${INSTALL_DATA} ${WRKINST}/usr/share/gnupg/options.skel \
		${IDIR_GNUPG}/usr/share/gnupg
	${INSTALL_BIN} ${WRKINST}/usr/bin/gpg ${IDIR_GNUPG}/usr/bin/
# we need root privileges for secure memory (locked pages)
	chmod u+s ${IDIR_GNUPG}/usr/bin/gpg

include ${TOPDIR}/mk/pkg-bottom.mk
