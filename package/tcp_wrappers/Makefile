# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		tcp_wrappers
PKG_VERSION:=		7.6
PKG_RELEASE:=		2
PKG_HASH:=		9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489a4315d
PKG_DESCR:=		ip based access control
PKG_SECTION:=		libs/misc
PKG_URL:=		ftp://ftp.porcupine.org/pub/security/index.html
PKG_SITES:=		ftp://ftp.porcupine.org/pub/security/
PKG_NOPARALLEL:=	1
PKG_LIBNAME:=		libwrap
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}_${PKG_VERSION}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBWRAP,libwrap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

ALL_TARGET:=		tidy all
MAKE_FLAGS+=		OPT_CFLAGS="${TARGET_CFLAGS}" \
			CC="${TARGET_CC}" \
			NETGROUP= \
			VSYSLOG= \
			BUGS= \
			EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR \
				-DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1 \
				-Dss_family=__ss_family -Dss_len=__ss_len" \
			FACILITY=LOG_DAEMON \
			SEVERITY=LOG_INFO \
			REAL_DAEMON_DIR=/usr/sbin \
			STYLE="-DPROCESS_OPTIONS" \

do-install:
	${INSTALL_DIR} ${IDIR_LIBWRAP}/usr/lib
	${CP} ${WRKBUILD}/shared/libwrap.so* ${IDIR_LIBWRAP}/usr/lib/
	${INSTALL_DIR} ${WRKINST}/usr/lib ${WRKINST}/usr/include
	${CP} ${WRKBUILD}/tcpd.h ${WRKINST}/usr/include
	${CP} ${WRKBUILD}/shared/libwrap.so* ${WRKINST}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
