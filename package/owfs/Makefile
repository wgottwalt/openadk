# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		owfs
PKG_VERSION:=		2.7p38
PKG_RELEASE:=		1
PKG_MD5SUM:=		c287d96c629b5deb6c85e6a82eecdc8a
PKG_DESCR:=		software to access 1-wire devices
PKG_SECTION:=		misc
PKG_BUILDDEP:=		fuse
PKG_URL:=		http://owfs.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=owfs/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OWFS,owfs,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-ldl -lrt -liconv
CONFIGURE_ARGS+=	--enable-owfs \
			--enable-usb \
			--disable-swig \
			--disable-owhttpd \
			--disable-owftpd \
			--disable-owcapi \
			--disable-owserver \
			--disable-owpython \
			--disable-owtcl \
			--disable-owperl \
			--disable-owphp \
			--with-fuseinclude=${STAGING_TARGET_DIR}/usr/include \
			--with-fuselib=${STAGING_TARGET_DIR}/usr/lib

owfs-install:
	${INSTALL_DIR} ${IDIR_OWFS}/usr/{bin,lib}
	${CP} ${WRKINST}/usr/lib/libow*.so* \
	               ${IDIR_OWFS}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/bin/ow* \
		${IDIR_OWFS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
