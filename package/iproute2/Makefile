# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iproute2
PKG_VERSION:=		2.6.29-1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c1bc258a6c345905e79935ac7a3cc582
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2
MASTER_SITES:=		http://developer.osdl.org/dev/iproute2/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IP,ip,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,TC,tc,${PKG_VERSION}-${PKG_RELEASE}))

do-configure:
	${SED} "s:-O2:${TARGET_CFLAGS}:g" ${WRKBUILD}/Makefile
	${SED} "s,-I/usr/include/db3,," ${WRKBUILD}/Makefile
	${SED} "s,^KERNEL_INCLUDE.*,KERNEL_INCLUDE=${LINUX_DIR}/include," \
		${WRKBUILD}/Makefile
	${SED} "s,^LIBC_INCLUDE.*,LIBC_INCLUDE=${STAGING_DIR}/include," \
		${WRKBUILD}/Makefile
	# For now disable compiling of the misc directory because it seems to fail
	rm -rf ${WRKBUILD}/misc
	${SED} "s, misc,," ${WRKBUILD}/Makefile
	# netem is 2.6 only stuff
	${SED} "s, netem,," ${WRKBUILD}/Makefile

do-build:
	${MAKE} -j1 -C ${WRKBUILD}/netem \
		HOSTCC=${HOSTCC} \
		CCOPTS="-I${LINUX_DIR}" \
	${MAKE} -j1 -C ${WRKBUILD} ${TARGET_CONFIGURE_OPTS} \
		CFLAGS="-D_GNU_SOURCE ${TARGET_CFLAGS} -I ../include -DRESOLVE_HOSTNAMES" \
		KERNEL_INCLUDE=${LINUX_DIR}/include all tc/tc ip/ip \
		CCOPTS="-I${LINUX_DIR}"

do-install:
	${INSTALL_DIR} ${IDIR_IP}/usr/sbin
	${CP} ${WRKBUILD}/ip/ip ${IDIR_IP}/usr/sbin/
	${INSTALL_DIR} ${IDIR_TC}/usr/sbin
	${CP} ${WRKBUILD}/tc/tc ${IDIR_TC}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
