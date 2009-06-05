# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tcp_wrappers
PKG_VERSION:=		7.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		e6fa25f71226d090f34de3f6b122fb5a
PKG_DESCR:=		IP based access control
PKG_SECTION:=		net
PKG_SITES:=		ftp://ftp.porcupine.org/pub/security/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}_${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBWRAP,libwrap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
ALL_TARGET:=		tidy all
MAKE_FLAGS+=		OPT_CFLAGS="${TARGET_CFLAGS}" \
			CC="${TARGET_CC}" \
			NETGROUP= \
			VSYSLOG= \
			BUGS= \
			EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1 \
				-Dss_family=__ss_family -Dss_len=__ss_len" \
			FACILITY=LOG_DAEMON \
			SEVERITY=LOG_INFO \
			REAL_DAEMON_DIR=/usr/sbin \
			STYLE="-DPROCESS_OPTIONS" \

do-install:
	${INSTALL_DIR} ${IDIR_LIBWRAP}/usr/lib
	${CP} ${WRKBUILD}/shared/libwrap.so.* ${IDIR_LIBWRAP}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
