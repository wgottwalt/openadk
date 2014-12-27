# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libnet
PKG_VERSION:=		1.1.6
PKG_RELEASE:=		1
PKG_HASH:=		d392bb5825c4b6b672fc93a0268433c86dc964e1500c279dc6d0711ea6ec467a
PKG_DESCR:=		low-level packet creation library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libpcap libstdcxx
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://sourceforge.net/projects/libnet-dev/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libnet-dev/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNET,libnet,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
ENDIAN:=lil
ifeq (${ADK_TARGET_CPU_ARCH},mips)
ENDIAN:=big
endif
ifeq (${ADK_TARGET_CPU_ARCH},mips64)
ENDIAN:=big
endif
ifeq (${ADK_TARGET_CPU_ARCH},ppc)
ENDIAN:=big
endif

CONFIGURE_ENV+=		ac_cv_libnet_endianess=${ENDIAN} \
			ac_cv_lbl_unaligned_fail=no

libnet-install:
	${INSTALL_DIR} ${IDIR_LIBNET}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnet.so* ${IDIR_LIBNET}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
