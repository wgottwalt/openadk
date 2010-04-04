# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		lynx
PKG_VERSION=		2.8.7dev.7
PKG_RELEASE=		2
PKG_MD5SUM=		83891107c873421e5ac917cc0ab53fe8
PKG_DESCR:=		Standard text browser
PKG_SECTION:=		text
PKG_DEPENDS:=		libncurses libopenssl zlib
PKG_BUILDDEP+=		ncurses openssl zlib
PKG_URL:=		http://lynx.isc.org
PKG_SITES=		http://lynx.isc.org/current/ \
			${MASTER_SITE_MIRBSD}

DISTFILES=		${PKG_NAME}${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/lynx2-8-7

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LYNX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCPPFLAGS+=		-DLYNX_VERSION=\"${PKG_VERSION}-${PKG_RELEASE}\"
TCPPFLAGS+=		-I${STAGING_DIR}/include/openssl
TCPPFLAGS+=		-DUSE_OPENSSL_INCL -DUSE_X509_SUPPORT
TLDFLAGS+=		-lz

CONFIGURE_ENV+=		ac_cv_path_TELNET=telnet \
			ac_cv_path_TN3270=tn3270 \
			ac_cv_path_RLOGIN=rlogin \
			ac_cv_path_MV=mv \
			ac_cv_path_GZIP=gzip \
			ac_cv_path_UNCOMPRESS=gunzip \
			ac_cv_path_UNZIP=unzip \
			ac_cv_path_BZIP2=bzip2 \
			ac_cv_path_TAR=tar \
			ac_cv_path_COMPRESS=compress \
			ac_cv_path_RM=rm \
			ac_cv_path_UUDECODE=uudecode \
			ac_cv_path_ZCAT=zcat \
			ac_cv_path_ZIP=zip

CONFIGURE_ARGS+=	\
			--disable-warnings \
			--disable-nls \
			--without-gnutls \
			--without-socks \
			--without-socks5 \
			--enable-addrlist-page \
			--enable-charset-choice \
			--enable-color-style \
			--disable-default-colors \
			--disable-htmlized-cfg \
			--enable-nested-tables \
			--disable-scrollbar \
			--enable-justify-elts \
			--enable-internal-links \
			--enable-nsl-fork \
			--enable-underlines \
			--without-bzlib \
			--without-x \
			--with-zlib=${STAGING_DIR}/usr \
			--with-ssl=${STAGING_DIR}/usr \
			--disable-full-paths \
			--with-cfg-file=/etc/lynx.cfg \
			--with-lss-file=/etc/lynx.lss \
			--disable-font-switch \
			--disable-japanese-utf8 \
			--disable-vertrace \
			--disable-trace \
			--disable-cjk \
			--disable-kbd-layout \
			--disable-prettysrc \
			--disable-finger \
			--disable-dired \
			--with-screen=ncurses \
			--disable-widec \
			--disable-locale-charset

MAKE_FILE:=		makefile

post-install:
	${INSTALL_DIR} ${IDIR_LYNX}/etc ${IDIR_LYNX}/usr/bin
	${CP} ${WRKINST}/etc/lynx.{cfg,lss} ${IDIR_LYNX}/etc
	${CP} ${WRKINST}/usr/bin/lynx ${IDIR_LYNX}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
