# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gsm
PKG_VERSION:=		1.0.10
PKG_RELEASE:=		2
PKG_MD5SUM:=		4b148480f82e96d274248e13880ec873
PKG_DESCR:=		gsm full-rate speech transcoding library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www-rn.informatik.uni-bremen.de/software/gsm/
PKG_SITES:=		http://www-rn.informatik.uni-bremen.de/software/gsm/
PKG_NOPARALLEL:=	1
PKG_LIBNAME:=		libgsm
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		LIBGSM GSM_UTILS
PKGSD_GSM_UTILS:=	gsm full-rate speech transcoding utilities
PKGSS_GSM_UTILS:=	libgsm
PKGSC_GSM_UTILS:=	sys/misc

WRKDIST=		${WRKDIR}/${PKG_NAME}-1.0-pl10

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGSM,libgsm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,GSM_UTILS,gsm-utils,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_GSM_UTILS},${PKGSD_GSM_UTILS},${PKGSC_GSM_UTILS}))

CONFIG_STYLE:=		manual

XAKE_FLAGS+=		COPTS="${TARGET_CFLAGS} -fPIC" \
			INSTALL_ROOT="${WRKINST}"

libgsm-install:
	${INSTALL_DIR} ${IDIR_LIBGSM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgsm.so* ${IDIR_LIBGSM}/usr/lib

gsm-utils-install:
	${INSTALL_DIR} ${IDIR_GSM_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/toast ${IDIR_GSM_UTILS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
