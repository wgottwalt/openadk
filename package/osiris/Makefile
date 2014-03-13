# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		osiris
PKG_VERSION:=		4.2.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		1951c7dc0fe729af9ffaf58910340d12
PKG_DESCR:=		Host Integrity Monitoring System (scanning agent)
PKG_SECTION:=		admin
PKG_DEPENDS:=		libopenssl libpthread
PKG_BUILDDEP:=		openssl
PKG_URL:=		http://osiris.shmoo.com/
PKG_SITES:=		http://openadk.org/distfiles/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OSIRIS,osiris,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_openssldir="${STAGING_TARGET_DIR}/usr" \
			ac_cv_have_accrights_in_msghdr=no \
			ac_cv_have_control_in_msghdr=yes
CONFIGURE_ARGS+=	--with-osiris-user=root \
			--with-root-dir=/var/lib/osiris \
			--with-readline=no
XAKE_FLAGS+=		ar=${TARGET_CROSS}ar \
			INTERACTIVE=0
TARGET_CFLAGS+=		-DOPENSSL_NO_RIPEMD

post-configure:
	(cd ${WRKDIST}/src/osirisd/modules && ./genmods.sh);

osiris-install:
	${INSTALL_DIR} ${IDIR_OSIRIS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/osirisd \
		${IDIR_OSIRIS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
