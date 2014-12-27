# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		owfs
PKG_VERSION:=		2.9p1
PKG_RELEASE:=		1
PKG_HASH:=		9d22dbff72d235476688c02669f7171b23e21dffadf40bbdd3b8263908218424
PKG_DESCR:=		software to access 1-wire devices
PKG_SECTION:=		sys/hw
PKG_BUILDDEP:=		fuse
PKG_URL:=		http://owfs.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=owfs/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
