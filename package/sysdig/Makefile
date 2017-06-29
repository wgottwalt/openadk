# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		sysdig
PKG_VERSION:=		2a7fa53b035fabe85b5d83aa7de20080056fb4bc
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_DESCR:=		system troubleshooting tool
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		zlib jsoncpp luajit jq libressl libcurl
PKG_BUILDDEP:=		cmake-host zlib jsoncpp luajit jq libressl
PKG_BUILDDEP+=		curl
PKG_KDEPENDS:=		ftrace generic-tracer function-tracer
PKG_NEEDS:=		c++
PKG_URL:=		http://www.sysdig.org/
PKG_SITES:=		https://github.com/draios/sysdig.git

PKG_SYSTEM_DEPENDS:=	!mikrotik-rb532

include $(ADK_TOPDIR)/mk/package.mk
include ${ADK_TOPDIR}/mk/kernel-ver.mk

$(eval $(call PKG_template,SYSDIG,sysdig,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

WRKBUILD=		$(WRKDIR)/$(PKG_NAME)-obj
CONFIG_STYLE:=		cmake
CMAKE_FLAGS:=		-DUSE_BUNDLED_DEPS=OFF -DUSE_BUNDLED_B64=ON
XAKE_FLAGS+=		KERNELDIR="$(LINUX_DIR)" \
			ARCH=$(ADK_TARGET_ARCH) \
			GCC_HONOUR_COPTS=s

sysdig-install:
	$(INSTALL_DIR) $(IDIR_SYSDIG)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/sysdig \
		$(IDIR_SYSDIG)/usr/bin
	$(INSTALL_DIR) $(IDIR_SYSDIG)/usr/share
	$(CP) $(WRKINST)/usr/share/* \
		$(IDIR_SYSDIG)/usr/share
	${INSTALL_DIR} ${IDIR_SYSDIG}/etc/modules.d/
	echo "sysdig-probe" > ${IDIR_SYSDIG}/etc/modules.d/90-sysdig
	${INSTALL_DIR} ${IDIR_SYSDIG}/lib/modules/${KERNEL_VERSION}/
	${INSTALL_DATA} ${WRKBUILD}/driver/sysdig-probe.ko \
		${IDIR_SYSDIG}/lib/modules/${KERNEL_VERSION}

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
