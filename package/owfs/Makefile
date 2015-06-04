# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		owfs
PKG_VERSION:=		3.1p0
PKG_RELEASE:=		1
PKG_HASH:=		62fca1b3e908cd4515c9eb499bf2b05020bbbea4a5b73611ddc6f205adec7a54
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
			--disable-owshell \
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
