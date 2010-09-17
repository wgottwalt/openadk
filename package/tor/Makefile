# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tor
PKG_VERSION:=		0.2.1.24
PKG_RELEASE:=		1
PKG_MD5SUM:=		cb5629b2709ada82d34c22fef3ed77a9
PKG_DESCR:=		An anonymous Internet communication system
PKG_SECTION:=		proxy
PKG_DEPENDS:=		libevent libopenssl zlib libpthread
PKG_BUILDDEP:=		libevent openssl zlib
PKG_URL:=		http://tor.eff.org/
PKG_SITES:=		http://tor.eff.org/dist/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TOR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_libevent_normal=yes \
			ac_cv_libevent_linker_option="" \
			ac_cv_libevent_dir="${STAGING_DIR}/usr" \
			ac_cv_openssldir="${STAGING_DIR}/usr" \
			ac_cv_openssl_linker_option="" \
			tor_cv_time_t_signed=yes \
			tor_cv_null_is_zero=yes \
			tor_cv_unaligned_ok=yes

post-install:
	${INSTALL_DIR} ${IDIR_TOR}/usr/bin ${IDIR_TOR}/etc/tor
	${INSTALL_DATA} ./files/torrc ${IDIR_TOR}/etc/tor/
	${CP} ${WRKINST}/usr/bin/tor ${IDIR_TOR}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
