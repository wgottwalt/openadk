# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tor
PKG_VERSION:=		0.2.1.20
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libevent openssl zlib
PKG_MD5SUM:=		0d62ee2332fdd95de43debac7435df19
PKG_DESCR:=		An anonymous Internet communication system
PKG_SECTION:=		net
PKG_DEPENDS:=		libevent libopenssl libpthread zlib
PKG_URL:=		http://tor.eff.org
PKG_SITES:=		http://tor.eff.org/dist/ \
			http://ftp.se.linux.org/crypto/tor/ \
			http://tor.meulie.net/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TOR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_libevent_normal=yes \
			ac_cv_libevent_linker_option="" \
			ac_cv_libevent_dir="${STAGING_DIR}/usr" \
			ac_cv_openssldir="${STAGING_DIR}/usr" \
			ac_cv_openssl_linker_option="" \
			tor_cv_time_t_signed=yes \
			tor_cv_null_is_zero=yes \
			tor_cv_unaligned_ok=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_TOR}/usr/bin ${IDIR_TOR}/etc/tor
	${INSTALL_DATA} ./files/torrc ${IDIR_TOR}/etc/tor/
	${CP} ${WRKINST}/usr/bin/tor ${IDIR_TOR}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
