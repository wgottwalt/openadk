# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tor
PKG_VERSION:=		0.1.1.26
PKG_RELEASE:=		9
PKG_MD5SUM:=		0667df7a1f670bee5163b607aea172ba

MASTER_SITES:=		http://tor.eff.org/dist/ \
			http://ftp.se.linux.org/crypto/tor/ \
			http://tor.meulie.net/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TOR,tor,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

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
	${INSTALL_DIR} ${IDIR_TOR}/etc/init.d
	${INSTALL_BIN} ./files/tor.init ${IDIR_TOR}/etc/init.d/tor
	${INSTALL_DIR} ${IDIR_TOR}/etc/tor
	${INSTALL_DATA} ./files/torrc ${IDIR_TOR}/etc/tor/
	${INSTALL_DIR} ${IDIR_TOR}/usr/bin
	${CP} ${WRKINST}/usr/bin/tor ${IDIR_TOR}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
