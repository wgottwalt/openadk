# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mt-daapd
PKG_VERSION:=		0.2.4.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		67bef9fb14d487693b0dfb792c3f1b05
PKG_DESCR:=		multi-threaded daap daemon
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libgdbm libid3tag libpthread
PKG_BUILDDEP:=		gdbm libid3tag
PKG_URL:=		http://www.fireflymediaserver.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mt-daapd/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MT_DAAPD,mt-daapd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes
CONFIGURE_ARGS+=	--enable-mdns \
			--disable-howl \
			--with-id3tag="${STAGING_TARGET_DIR}/usr" \
			--with-gdbm-includes="${STAGING_TARGET_DIR}/usr/include" \
			--with-gdbm-libs="${STAGING_TARGET_DIR}/usr/lib" \
			--without-static-libs
TARGET_LDFLAGS+=	-pthread

mt-daapd-install:
	${INSTALL_DIR} ${IDIR_MT_DAAPD}/etc ${IDIR_MT_DAAPD}/usr/{share,sbin}
	${INSTALL_DATA} ${WRKBUILD}/contrib/mt-daapd.conf \
		${IDIR_MT_DAAPD}/etc/
	${INSTALL_DATA} ${WRKBUILD}/contrib/mt-daapd.playlist \
		${IDIR_MT_DAAPD}/etc/
	${CP} ${WRKINST}/usr/share/mt-daapd ${IDIR_MT_DAAPD}/usr/share/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mt-daapd \
		${IDIR_MT_DAAPD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
