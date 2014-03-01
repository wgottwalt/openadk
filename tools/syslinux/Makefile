# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		syslinux
PKG_VERSION:=		6.02
PKG_RELEASE:=		1
PKG_MD5SUM:=		086ac1c569d226a5e2ae3d605de09a1d
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/boot/syslinux/

include ../rules.mk
WRKINST:=		${WRKBUILD}/openadk_installroot

install: ${STAGING_HOST_DIR}/usr/bin/extlinux ${STAGING_HOST_DIR}/usr/share/syslinux/.installed

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}' bios installer
	@touch $@

$(WRKBUILD)/.installed: ${WRKBUILD}/.compiled
	mkdir -p ${WRKINST}
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}' \
		INSTALLROOT='${WRKINST}' \
		bios install
	@touch $@

${STAGING_HOST_DIR}/usr/bin/extlinux: $(WRKBUILD)/.installed
	$(INSTALL_BIN) ${WRKINST}/sbin/extlinux \
		${STAGING_HOST_DIR}/usr/bin

${STAGING_HOST_DIR}/usr/share/syslinux/.installed: ${WRKBUILD}/.installed
	mkdir -p ${STAGING_HOST_DIR}/usr/share
	${CP} ${WRKINST}/usr/share/syslinux ${STAGING_HOST_DIR}/usr/share
	@touch ${STAGING_HOST_DIR}/usr/share/syslinux/.installed

include $(TOPDIR)/mk/tools.mk
