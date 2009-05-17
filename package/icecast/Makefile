# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		icecast
PKG_VERSION:=		2.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		ff516b3ccd2bcc31e68f460cd316093f
MASTER_SITES:=		http://downloads.us.xiph.org/releases/icecast/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ICECAST,icecast,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

TCPPFLAGS+=		-I${STAGING_DIR}/usr/include/libxml2
CONFIGURE_STYLE=	autotool gnu
CONFIGURE_ARGS+=	--disable-yp \
			--with-curl="yes" \
			--with-curl-config="${STAGING_DIR}/usr/bin/curl-config" \
			--with-ogg="${STAGING_DIR}/usr" \
			--with-vorbis="${STAGING_DIR}/usr" \
			--with-speex="no" \
			--with-theora="no" \
			--with-xslt-config="${STAGING_DIR}/usr/bin/xslt-config"
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_ICECAST}/etc
	${CP} ${WRKINST}/etc/icecast.xml ${IDIR_ICECAST}/etc/
	${INSTALL_DIR} ${IDIR_ICECAST}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/icecast ${IDIR_ICECAST}/usr/bin/
	${INSTALL_DIR} ${IDIR_ICECAST}/usr/share/icecast
	${CP} ${WRKINST}/usr/share/icecast/admin ${IDIR_ICECAST}/usr/share/icecast/
	${CP} ${WRKINST}/usr/share/icecast/web ${IDIR_ICECAST}/usr/share/icecast/

include ${TOPDIR}/mk/pkg-bottom.mk
