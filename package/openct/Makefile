# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openct
PKG_VERSION:=		0.6.16
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libtool libusb
PKG_MD5SUM:=		d8d8c63269985303a303a218c4b953d7
PKG_DESCR:=		drivers for several smart card readers
PKG_SECTION:=		libs
PKG_DEPENDS:=		libltdl libusb
PKG_URL:=		http://www.opensc-project.org/openct
PKG_SITES:=		http://www.opensc-project.org/files/openct/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENCT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_OPENCT}/etc ${IDIR_OPENCT}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENCT}/usr/sbin ${IDIR_OPENCT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopenct.so.* \
		${IDIR_OPENCT}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/openct-control \
		${IDIR_OPENCT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ifd* \
		${IDIR_OPENCT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/openct-tool \
		${IDIR_OPENCT}/usr/bin
	${INSTALL_DATA} ${WRKBUILD}/etc/openct.conf \
		${IDIR_OPENCT}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
