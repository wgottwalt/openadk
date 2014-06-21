# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		dsniff
PKG_VERSION:=		2.4b1
PKG_RELEASE:=		2
PKG_MD5SUM:=		2f761fa3475682a7512b0b43568ee7d6
PKG_DESCR:=		tools for network auditing and penetration testing
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libnet libpcap libnids libopenssl libgdbm
PKG_BUILDDEP:=		libnids openssl gdbm libpcap libnet
PKG_URL:=		http://www.monkey.org/~dugsong/dsniff/
PKG_SITES:=		http://www.monkey.org/~dugsong/dsniff/beta/

# rpc problem
PKG_CFLINE_DSNIFF:=	depends on ADK_BROKEN
PKG_ARCH_DEPENDS:=	!arm
PKG_LIBC_DEPENDS:=	uclibc glibc

WRKDIST=		${WRKDIR}/${PKG_NAME}-2.4
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DSNIFF,dsniff,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-db \
			--without-x \
			--with-gdbm="${STAGING_TARGET_DIR}/usr" \
			--with-libnids="${STAGING_TARGET_DIR}/usr" \
			--with-libpcap="${STAGING_TARGET_DIR}/usr" \
			--with-libnet="${STAGING_TARGET_DIR}/usr" \
			--with-openssl="${STAGING_TARGET_DIR}/usr"
FAKE_FLAGS+=		install_prefix="${WRKINST}"

dsniff-install:
	${INSTALL_DIR} ${IDIR_DSNIFF}/usr/lib ${IDIR_DSNIFF}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_DSNIFF}/usr/sbin
	${CP} ${WRKINST}/usr/lib/* ${IDIR_DSNIFF}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
