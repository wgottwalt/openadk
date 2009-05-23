# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rrdtool
PKG_VERSION:=		1.2.30
PKG_RELEASE:=		1
PKG_MD5SUM:=		19b24f7184a8dbf7b48c1bbb565ad9fb
MASTER_SITES:=		http://oss.oetiker.ch/rrdtool/pub/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBRRD,librrd,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,RRDCGI,rrdcgi,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,RRDTOOL,rrdtool,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		rd_cv_ieee_works=yes
CONFIGURE_ARGS+=	--enable-rrdcgi \
			--disable-mmap \
			--disable-perl \
			--disable-ruby \
			--disable-tcl \
			--disable-python \
			--without-x \
			--with-rrd-default-font=/usr/share/rrdtool/fonts/DejaVuSansMono-Roman.ttf
TCPPFLAGS+=		-I${STAGING_DIR}/usr/include/freetype2
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_RRDTOOL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rrdtool ${WRKINST}/usr/bin/rrdupdate \
	               ${IDIR_RRDTOOL}/usr/bin/
	${INSTALL_DIR} ${IDIR_RRDCGI}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rrdcgi ${IDIR_RRDCGI}/usr/bin/
	${INSTALL_DIR} ${IDIR_LIBRRD}/usr/lib
	${CP} ${WRKINST}/usr/lib/librrd.so.* ${IDIR_LIBRRD}/usr/lib/
	${INSTALL_DIR} ${IDIR_LIBRRD}/usr/share/rrdtool/fonts
	${CP} ${WRKBUILD}/src/DejaVuSansMono-Roman.ttf \
		${IDIR_LIBRRD}/usr/share/rrdtool/fonts/

include ${TOPDIR}/mk/pkg-bottom.mk
