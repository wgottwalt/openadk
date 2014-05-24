# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bzip2
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		3
PKG_MD5SUM:=		00b516f4704d4a7cb50a1d97e6e8e15b
PKG_DESCR:=		compression utility
PKG_SECTION:=		archive
PKG_BUILDDEP:=		bzip2-host
PKG_DEPENDS:=		libbz2
PKG_URL:=		http://www.bzip.org/
PKG_SITES:=		http://www.bzip.org/${PKG_VERSION}/
PKG_LIBNAME:=		libbz2
PKG_OPTS:=		dev
PKG_BB:=		1

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		BZIP2 LIBBZ2
PKGSD_LIBBZ2:=		bzip2 compression library
PKGSC_LIBBZ2:=		libs

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,BZIP2,bzip2,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,BZIP2,bzip2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBBZ2,libbz2,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBBZ2},${PKGSC_LIBBZ2},${PKG_OPTS}))

HOST_STYLE:=		manual
HOST_MAKE_FILE:=	Makefile
MAKE_FILE:=		Makefile-libbz2_so
CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-fPIC 
XAKE_FLAGS+=		PREFIX=${WRKINST}/usr CROSS_COMPILE=1
INSTALL_STYLE:=		manual

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${HOST_MAKE_FILE} \
		PREFIX=${HOST_WRKINST}/usr ${HOST_ALL_TARGET})

bzip2-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	$(INSTALL_BIN) ${WRKBUILD}/bzip2 ${STAGING_HOST_DIR}/usr/bin/bzip2

libbz2-install:
	${INSTALL_DIR} ${IDIR_LIBBZ2}/usr/lib
	$(CP) ${WRKBUILD}/libbz2.so* \
		${IDIR_LIBBZ2}/usr/lib
	$(CP) ${WRKBUILD}/libbz2.so* \
		${STAGING_TARGET_DIR}/usr/lib
	(cd ${STAGING_TARGET_DIR}/usr/lib; ln -sf libbz2.so.1.0.6 libbz2.so)
	$(CP) $(WRKBUILD)/bzlib.h $(STAGING_TARGET_DIR)/usr/include
	${INSTALL_DIR} $(IDIR_LIBBZ2_DEV)/usr/include
	$(CP) $(WRKBUILD)/bzlib.h $(IDIR_LIBBZ2_DEV)/usr/include

bzip2-install:
	${INSTALL_DIR} ${IDIR_BZIP2}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bzip2-shared ${IDIR_BZIP2}/usr/bin/bzip2

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
