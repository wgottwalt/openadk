# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		huawei
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_DESCR:=		huawei modem control
PKG_SECTION:=		utils
PKG_DEPENDS:=		libusb
PKG_BUILDDEP:=		libusb

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HUAWEI,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} -Wall ${TCPPFLAGS} ${TCFLAGS} \
		-o ${WRKBUILD}/huawei ${WRKBUILD}/huawei.c -lusb

do-install:
	${INSTALL_DIR} ${IDIR_HUAWEI}/sbin
	${INSTALL_BIN} ${WRKBUILD}/huawei ${IDIR_HUAWEI}/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
