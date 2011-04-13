# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnet
PKG_VERSION:=		1.1.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		a9bc1d75a610efcfee200d3e28d8eb8f
PKG_DESCR:=		a low-level packet creation library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpcap
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://sourceforge.net/projects/libnet-dev/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libnet-dev/}
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		LIBNET LIBNET_DEV
PKGSC_LIBNET_DEV:=	devel
PKGSD_LIBNET_DEV:=	libnet headers

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNET,libnet,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNET_DEV,libnet-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBNET_DEV},${PKGSC_LIBNET_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
ENDIAN:=lil
ifeq (${CPU_ARCH},mips)
ENDIAN:=big
endif
ifeq (${CPU_ARCH},mips64)
ENDIAN:=big
endif
ifeq (${CPU_ARCH},ppc)
ENDIAN:=big
endif

CONFIGURE_ENV+=		ac_cv_libnet_endianess=${ENDIAN} \
			ac_cv_lbl_unaligned_fail=no

libnet-install:
	${INSTALL_DIR} ${IDIR_LIBNET}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnet.so* ${IDIR_LIBNET}/usr/lib

libnet-dev-install:
	${INSTALL_DIR} ${IDIR_LIBNET_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBNET_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBNET_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libnet-config \
		${IDIR_LIBNET_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
