# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		faad2
PKG_VERSION:=		2.7
PKG_RELEASE:=		1
PKG_HASH:=		ee26ed1e177c0cd8fa8458a481b14a0b24ca0b51468c8b4c8b676fd3ceccd330
PKG_DESCR:=		mp4 decoding library
PKG_SECTION:=		libs/video
PKG_URL:=		http://sourceforge.net/projects/faac/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=faac/}
PKG_LIBNAME:=		libfaad2
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFAAD2,libfaad2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
# check for lrintf fails on Darwin, don't know why
CONFIGURE_ENV+=		ac_cv_c99_lrintf=yes
CONFIGURE_ARGS+=	--without-mpeg4ip \
			--without-xmms
TARGET_LDFLAGS+=	-lm

libfaad2-install:
	${INSTALL_DIR} ${IDIR_LIBFAAD2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfaad.so* ${IDIR_LIBFAAD2}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
