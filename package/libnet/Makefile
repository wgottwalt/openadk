# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnet
PKG_VERSION:=		1.0.2a
PKG_RELEASE:=		7
PKG_MD5SUM:=		ddf53f0f484184390e8c2a1bd0853667
PKG_DESCR:=		a low-level packet creation library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpcap
PKG_SITES:=		http://www.packetfactory.net/libnet/dist/deprecated/

WRKDIST=		${WRKDIR}/Libnet-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

ENDIAN:=lil
ifeq (${CPU_ARCH},mips)
ENDIAN:=big
endif

$(eval $(call PKG_template,LIBNET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_libnet_have_pf_packet=yes \
			ac_cv_lbl_unaligned_fail=no \
			ac_cv_libnet_endianess=${ENDIAN}
CONFIGURE_ARGS+=	--with-pf_packet=yes
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBNET}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnet.so.* ${IDIR_LIBNET}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
