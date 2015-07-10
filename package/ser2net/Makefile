# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ser2net
PKG_VERSION:=		2.10.0
PKG_RELEASE:=		1
PKG_HASH:=		98f6193225338e25f35302fef5e1f16688693ed43e7b3c3e9e09187eb54547ac
PKG_DESCR:=		allowing network connections to serial ports
PKG_SECTION:=		net/misc
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ser2net/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SER2NET,ser2net,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_lib_nsl_main=no

ser2net-install:
	${INSTALL_DIR} ${IDIR_SER2NET}/etc ${IDIR_SER2NET}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ser2net ${IDIR_SER2NET}/usr/sbin
	${INSTALL_DATA} ${WRKBUILD}/ser2net.conf ${IDIR_SER2NET}/etc

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
