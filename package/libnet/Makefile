# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnet
PKG_VERSION:=		1.1.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		710296fe424a49344e5fcc0d09e53317
PKG_DESCR:=		low-level packet creation library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpcap libstdcxx
PKG_BUILDDEP:=		libpcap autotool
PKG_URL:=		http://sourceforge.net/projects/libnet-dev/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libnet-dev/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNET,libnet,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
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

include ${TOPDIR}/mk/pkg-bottom.mk
