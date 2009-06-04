# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cfgfs
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		2
PKG_DESCR:=		compressed config filesystem
PKG_SECTION:=		base

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CFGFS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto

do-configure:
	mkdir -p ${WRKBUILD}
	${CP} ./src/* ${WRKBUILD}
	${TARGET_CC} ${TCPPFLAGS} ${TCFLAGS} -o ${WRKBUILD}/mtd ${WRKBUILD}/mtd.c

do-install:
	${INSTALL_DIR} ${IDIR_CFGFS}/sbin
	${INSTALL_BIN} ${WRKBUILD}/fwcf.sh ${IDIR_CFGFS}/sbin/cfgfs
	${INSTALL_BIN} ${WRKBUILD}/fwcf.helper.out ${IDIR_CFGFS}/sbin/cfgfs.helper
ifeq ($(ARCH),cris)
	${INSTALL_BIN} ${WRKBUILD}/mtd ${IDIR_CFGFS}/sbin/mtd
	echo '#!/bin/sh' > ${IDIR_CFGFS}/sbin/cfgfs.write
	echo 'mtd -F write - cfgfs' >> ${IDIR_CFGFS}/sbin/cfgfs.write
else
	echo '#!/bin/sh' > ${IDIR_CFGFS}/sbin/cfgfs.write
	echo 'cat > /dev/sda2' >> ${IDIR_CFGFS}/sbin/cfgfs.write
endif
	chmod 755 ${IDIR_CFGFS}/sbin/cfgfs.write

include ${TOPDIR}/mk/pkg-bottom.mk
