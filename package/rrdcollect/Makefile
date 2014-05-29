# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rrdcollect
PKG_VERSION:=		0.2.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		138e21fc9f2de0b8b6c89f1506394ef8
PKG_DESCR:=		round-robin database collecting daemon
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		librrd
PKG_BUILDDEP:=		rrdtool
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=rrdcollect/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

ifneq (${ADK_PACKAGE_LIBRRD},)
RRDTOOL_LIBS:=		-lart_lgpl_2 -lfreetype -lpng
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RRDCOLLECT,rrdcollect,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		LIBS="${RRDTOOL_LIBS} -lz" \
			ac_cv_func_malloc_0_nonnull=yes
CONFIGURE_ARGS+=	--enable-exec \
			--without-rrdtool \
			--without-libpcre \
			--with-librrd
TARGET_CPPFLAGS+=	-DSOCKET_COMM

rrdcollect-install:
	${INSTALL_DIR} ${IDIR_RRDCOLLECT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/rrdcollect \
		${IDIR_RRDCOLLECT}/usr/sbin/
	${INSTALL_DIR} ${IDIR_RRDCOLLECT}/etc
	${INSTALL_DATA} ./files/rrdcollect.conf \
		${IDIR_RRDCOLLECT}/etc/

include ${TOPDIR}/mk/pkg-bottom.mk
