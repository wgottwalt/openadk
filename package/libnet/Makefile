# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnet
PKG_VERSION:=		1.1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c5e06418a89cc4209f677a776a798fd9
PKG_DESCR:=		a low-level packet creation library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpcap
PKG_BUILDDEP+=		libpcap
PKG_URL:=		http://sourceforge.net/projects/libnet-dev/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libnet-dev/libnet-${PKG_VERSION}/}

include ${TOPDIR}/mk/package.mk

ENDIAN:=lil
ifeq (${CPU_ARCH},mips)
ENDIAN:=big
endif

$(eval $(call PKG_template,LIBNET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_libnet_have_pf_packet=yes \
			ac_cv_libnet_endianess=${ENDIAN} \
			LL_INT_TYPE=linux \
			ac_cv_lbl_unaligned_fail=no
CONFIGURE_ARGS+=	--with-pf_packet=yes

post-install:
	${INSTALL_DIR} ${IDIR_LIBNET}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnet.so* ${IDIR_LIBNET}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
