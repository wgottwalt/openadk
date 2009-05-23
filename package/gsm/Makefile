# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gsm
PKG_VERSION:=		1.0.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		4b148480f82e96d274248e13880ec873
MASTER_SITES:=		http://www-rn.informatik.uni-bremen.de/software/gsm/
WRKDIST=		${WRKDIR}/${PKG_NAME}-1.0-pl10

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGSM,libgsm,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,GSM_UTILS,gsm-utils,${PKG_VERSION}-${PKG_RELEASE}))

XAKE_FLAGS+=		COPTS="${TARGET_CFLAGS}" \
			INSTALL_ROOT="${WRKINST}"
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBGSM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgsm.so.1.0.10 ${IDIR_LIBGSM}/usr/lib/
	${INSTALL_DIR} ${IDIR_GSM_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/toast ${IDIR_GSM_UTILS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
