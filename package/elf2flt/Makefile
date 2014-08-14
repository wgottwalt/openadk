# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		elf2flt
PKG_VERSION:=		20140814
PKG_RELEASE:=		1
PKG_MD5SUM:=		be5c918b90a591d3d4037580cda1764a
PKG_DESCR:=		elf2flt utility
PKG_SECTION:=		dev/tools
PKG_SITES:=		http://www.openadk.org/distfiles/
BINUTILS_VERSION:=	2.24

PKG_CFLINE_ELF2FLT:=	depends on ADK_HOST_ONLY
PKG_DFLT_ELF2FLT:=	y if ADK_TARGET_BINFMT_FLAT

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,ELF2FLT,elf2flt,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-configure:
	(cd $(WRKBUILD); ./configure --prefix=$(STAGING_HOST_DIR)/usr \
			--target=$(ADK_TARGET_ARCH) \
			--with-bfd-include-dir=$(TOOLCHAIN_BUILD_DIR)/w-binutils-${BINUTILS_VERSION}-1/binutils-${BINUTILS_VERSION}/bfd \
			--with-binutils-include-dir=$(TOOLCHAIN_BUILD_DIR)/w-binutils-${BINUTILS_VERSION}-1/binutils-${BINUTILS_VERSION}/include \
			--with-libbfd=$(TOOLCHAIN_BUILD_DIR)/w-binutils-${BINUTILS_VERSION}-1/binutils-${BINUTILS_VERSION}/bfd/libbfd.a \
			--with-libiberty=$(TOOLCHAIN_BUILD_DIR)/w-binutils-${BINUTILS_VERSION}-1/binutils-${BINUTILS_VERSION}/libiberty/libiberty.a )

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET}) $(MAKE_TRACE)

elf2flt-hostinstall:
	${INSTALL_BIN} ${WRKBUILD}/elf2flt ${TOOLCHAIN_DIR}/usr/$(GNU_TARGET_NAME)/bin
	${INSTALL_BIN} ${WRKBUILD}/flthdr ${TOOLCHAIN_DIR}/usr/$(GNU_TARGET_NAME)/bin
	${INSTALL_BIN} ${WRKBUILD}/ld-elf2flt ${TOOLCHAIN_DIR}/usr/$(GNU_TARGET_NAME)/bin
	${INSTALL_DATA} ${WRKBUILD}/elf2flt.ld ${TOOLCHAIN_DIR}/usr/$(GNU_TARGET_NAME)/lib
	rm $(TOOLCHAIN_DIR)/usr/bin/$(GNU_TARGET_NAME)-ld
	(cd ${TOOLCHAIN_DIR}/usr/$(GNU_TARGET_NAME)/bin && \
		ln -sf ld.bfd ld.real )
	(cd $(TOOLCHAIN_DIR)/usr/bin && \
		ln -sf ../$(GNU_TARGET_NAME)/bin/elf2flt $(GNU_TARGET_NAME)-elf2flt && \
		ln -sf ../$(GNU_TARGET_NAME)/bin/flthdr $(GNU_TARGET_NAME)-flthdr && \
		ln -sf ../$(GNU_TARGET_NAME)/bin/ld-elf2flt $(GNU_TARGET_NAME)-ld-elf2flt && \
		ln -sf ../$(GNU_TARGET_NAME)/bin/ld-elf2flt $(GNU_TARGET_NAME)-ld )
	(cd $(TOOLCHAIN_DIR)/usr/bin/ && ln -sf $(GNU_TARGET_NAME)-ld.bfd $(GNU_TARGET_NAME)-ld.real )

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
