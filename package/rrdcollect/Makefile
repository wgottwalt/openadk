# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rrdcollect
PKG_VERSION:=		0.2.3
PKG_RELEASE:=		8
PKG_MD5SUM:=		5e4305c612bc3cccbaf802c275c81a11
PKG_DESCR:=		Round-Robin Database (RRD) collecting daemon
PKG_SECTION:=		admin
PKG_DEPENDS:=		librrd
PKG_BUILDDEP:=		rrdtool
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=rrdcollect/}

PKG_SUBPKGS:=		RRDCOLLECT RRDCOLLECT_EXAMPLE

ifneq (${ADK_PACKAGE_LIBRRD},)
RRDTOOL_LIBS:=-lart_lgpl_2 -lfreetype -lpng
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RRDCOLLECT,rrdcollect,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,RRDCOLLECT_EXAMPLE,rrdcollect-example,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		LIBS="${RRDTOOL_LIBS} -lz" \
			ac_cv_func_malloc_0_nonnull=yes
CONFIGURE_ARGS+=	--enable-exec \
			--without-rrdtool \
			--with-librrd \
			--without-libpcre \
			--without-libpcap
TCFLAGS+=		-DSOCKET_COMM

post-install:
	${INSTALL_DIR} ${IDIR_RRDCOLLECT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/rrdcollect \
		${IDIR_RRDCOLLECT}/usr/sbin/
	${INSTALL_DIR} ${IDIR_RRDCOLLECT_EXAMPLE}/etc
	${INSTALL_DATA} ./files/rrd.conf ./files/rrdcollect.conf \
		${IDIR_RRDCOLLECT_EXAMPLE}/etc/
	${INSTALL_DIR} ${IDIR_RRDCOLLECT_EXAMPLE}/usr/bin
	${INSTALL_BIN} ./files/rrd.sh ${IDIR_RRDCOLLECT_EXAMPLE}/usr/bin/
	${INSTALL_DIR} ${IDIR_RRDCOLLECT_EXAMPLE}/www/cgi-bin
	ln -sf /var/lib/rrdcollect/rrd.cgi \
		${IDIR_RRDCOLLECT_EXAMPLE}/www/cgi-bin/rrd.cgi
	ln -sf /var/lib/rrdcollect/img ${IDIR_RRDCOLLECT_EXAMPLE}/www/img

include ${TOPDIR}/mk/pkg-bottom.mk
