# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		radvd
PKG_VERSION:=		0.7.3
PKG_RELEASE:=		8
PKG_MD5SUM:=		56ce3f8cbf5966a0d531c21813320423

MASTER_SITES:=		http://v6web.litech.org/radvd/dist/ \
			http://download.sourcemage.org/mirror/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RADVD,radvd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-configfile=/etc/radvd.conf \
			--with-logfile=/var/log/radvd.log \
			--with-pidfile=/var/run/radvd.pid

do-build:
	$(MAKE) -C $(WRKBUILD) \
		radvd_LDADD=""
	mkdir -p $(WRKINST)
	$(MAKE) -C $(WRKBUILD) \
		DESTDIR="$(WRKINST)" \
		install

do-install:
	${INSTALL_DIR} ${IDIR_RADVD}/etc
	${INSTALL_DATA} ./files/radvd.conf ${IDIR_RADVD}/etc/
	${INSTALL_DIR} ${IDIR_RADVD}/etc/init.d
	${INSTALL_BIN} ./files/radvd.init ${IDIR_RADVD}/etc/init.d/radvd
	${INSTALL_DIR} ${IDIR_RADVD}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radvd ${IDIR_RADVD}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radvdump ${IDIR_RADVD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
