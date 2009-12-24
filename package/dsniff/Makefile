# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dsniff
PKG_VERSION:=		2.4b1
PKG_RELEASE:=		2
PKG_BUILDDEP+=		libnids openssl gdbm
PKG_MD5SUM:=		2f761fa3475682a7512b0b43568ee7d6
PKG_DESCR:=		tools for network auditing and penetration testing
PKG_SECTION:=		net
PKG_DEPENDS:=		libnet libpcap libnids libopenssl libgdbm
PKG_URL:=		http://www.monkey.org/~dugsong/dsniff
PKG_SITES:=		http://www.monkey.org/~dugsong/dsniff/beta/

WRKDIST=		${WRKDIR}/${PKG_NAME}-2.4

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DSNIFF,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--without-db \
			--without-x \
			--with-gdbm="${STAGING_DIR}/usr" \
			--with-libnids="${STAGING_DIR}/usr" \
			--with-libpcap="${STAGING_DIR}/usr" \
			--with-libnet="${STAGING_DIR}/usr" \
			--with-openssl="${STAGING_DIR}/usr"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
FAKE_FLAGS+=		install_prefix="${WRKINST}"

post-install:
	${INSTALL_DIR} ${IDIR_DSNIFF}/usr/lib ${IDIR_DSNIFF}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_DSNIFF}/usr/sbin
	${CP} ${WRKINST}/usr/lib/* ${IDIR_DSNIFF}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
