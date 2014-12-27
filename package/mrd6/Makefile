# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mrd6
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		1
PKG_HASH:=		4bbdb998a735b2f7b995ddd38382eb2c3ba13559742cf7b4abd40a8dbe48ba37
PKG_DESCR:=		ipv6 multicast routing daemon
PKG_SECTION:=		net/ipv6
PKG_SITES:=		http://www.openadk.org/distfiles/
PKG_CXX:=		MRD6

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKBUILD=		${WRKSRC}/src

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MRD6,mrd6,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

ifeq (${ADK_COMPILE_MRD6_WITH_UCLIBCXX},y)
LIBRARIES:=-nodefaultlibs -luClibc++
ifeq ($(ADK_TARGET_USE_SSP),y)
LIBRARIES+=-lssp -lssp_nonshared
endif
endif

ifeq (${ADK_COMPILE_MRD6_WITH_UCLIBCXX},y)
TARGET_CXXFLAGS+=	-fno-builtin -nostdinc++ \
			-I${STAGING_TARGET_DIR}/usr/include/uClibc++
TARGET_LDFLAGS+=	-shared ${LIBRARIES}
endif
XAKE_FLAGS+=		EXTRA_FLAGS="${TARGET_CFLAGS}"

mrd6-install:
	${INSTALL_DIR} ${IDIR_MRD6}/usr/sbin ${IDIR_MRD6}/etc
	${INSTALL_DIR} ${IDIR_MRD6}/usr/lib/mrd6 ${IDIR_MRD6}/usr/bin
	${INSTALL_DATA} ./files/${PKG_NAME}.conf ${IDIR_MRD6}/etc
	${INSTALL_BIN} ${WRKINST}/usr/local/sbin/mrd \
		 ${IDIR_MRD6}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/local/bin/mrd6sh \
		 ${IDIR_MRD6}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/local/lib/mrd6/bgp.so \
		 ${IDIR_MRD6}/usr/lib/mrd6/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
