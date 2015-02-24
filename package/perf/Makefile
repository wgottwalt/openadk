# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include $(ADK_TOPDIR)/mk/kernel-ver.mk

PKG_NAME:=		perf
PKG_VERSION:=		${KERNEL_VERSION}
PKG_RELEASE:=		1
PKG_DESCR:=		Userland tools for Linux Performance Counters
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		elfutils newt
PKG_URL:=		https://perf.wiki.kernel.org/index.php/Main_Page

NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk
include ${ADK_TOPDIR}/mk/kernel-vars.mk

$(eval $(call PKG_template,PERF,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${KERNEL_MAKE_ENV} GCC_HONOUR_COPTS=0 ${MAKE} \
		${KERNEL_MAKE_OPTS} WERROR=0 -C "${LINUX_DIR}/tools/perf" all

do-install:
	${KERNEL_MAKE_ENV} GCC_HONOUR_COPTS=0 ${MAKE} \
		${KERNEL_MAKE_OPTS} WERROR=0 -C "${LINUX_DIR}/tools/perf" \
		prefix="${WRKINST}" install
	${INSTALL_DIR} ${IDIR_PERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/bin/perf ${IDIR_PERF}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
