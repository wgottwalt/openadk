# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bzip2
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		00b516f4704d4a7cb50a1d97e6e8e15b
PKG_DESCR:=		bzip2 compression utility
PKG_SECTION:=		archive
PKG_DEPENDS:=		libbz2
PKG_URL:=		http://www.bzip.org/
PKG_SITES:=		http://www.bzip.org/${PKG_VERSION}/
PKG_SUBPKGS:=		BZIP2 LIBBZ2

PKGSD_LIBBZ2:=		bzip2 compression library
PKGSC_LIBBZ2:=		libs

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BZIP2,bzip2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBBZ2,libbz2,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBBZ2},${PKGSC_LIBBZ2}))

MAKE_FILE:=		Makefile-libbz2_so
CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-fPIC
XAKE_FLAGS+=		PREFIX=${WRKINST}/usr
INSTALL_STYLE:=		manual

libbz2-install:
	${INSTALL_DIR} ${IDIR_LIBBZ2}/usr/lib
	$(CP) ${WRKBUILD}/libbz2.so* \
		${IDIR_LIBBZ2}/usr/lib
	$(CP) ${WRKBUILD}/libbz2.so* \
		${STAGING_DIR}/usr/lib
	(cd ${STAGING_DIR}/usr/lib; ln -sf libbz2.so.1.0.6 libbz2.so)
	$(CP) $(WRKBUILD)/bzlib.h $(STAGING_DIR)/usr/include

bzip2-install:
	${INSTALL_DIR} ${IDIR_BZIP2}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bzip2-shared ${IDIR_BZIP2}/usr/bin/bzip2

include ${TOPDIR}/mk/pkg-bottom.mk
