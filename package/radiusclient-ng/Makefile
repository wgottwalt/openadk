# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		radiusclient-ng
PKG_VERSION:=		0.5.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		6fb7d4d0aefafaee7385831ac46a8e9c
MASTER_SITES:=		http://download.berlios.de/radiusclient-ng/ \
			http://download2.berlios.de/radiusclient-ng/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RADIUSCLIENT_NG,radiusclient-ng,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBRADIUSCLIENT_NG,libradiusclient-ng,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	ac_cv_func_getdomainname=yes
BUILD_STYLE:=		auto
ALL_TARGET:=		install-exec install-data
MAKE_FLAGS+=		DESTDIR="${WRKINST}"

do-install:
	${INSTALL_DIR} ${IDIR_RADIUSCLIENT_NG}/usr
	${CP} ${WRKINST}/usr/sbin ${IDIR_RADIUSCLIENT_NG}/usr/
	${CP} ${WRKINST}/etc ${IDIR_RADIUSCLIENT_NG}/
	${INSTALL_DIR} ${IDIR_LIBRADIUSCLIENT_NG}/usr
	${CP} ${WRKINST}/usr/lib ${IDIR_LIBRADIUSCLIENT_NG}/usr/

include ${TOPDIR}/mk/pkg-bottom.mk
