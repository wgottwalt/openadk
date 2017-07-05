# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ixp4xx-microcode
PKG_VERSION:=		2.4
PKG_RELEASE:=		1
PKG_HASH:=		1b1170d0657847248589d946048c0aeaa9cd671966fc5bec5933283309485eaa
PKG_DESCR:=		firmware for ixp4xx ethernet controller
PKG_SECTION:=		sys/firmware
PKG_SITES:=		http://distfiles.openadk.org/

PKG_SYSTEM_DEPENDS:=    linksys-nslu2

DISTFILES:=		IPL_ixp400NpeLibraryWithCrypto-2_4.zip
WRKDIST=		${WRKDIR}/ixp400_xscale_sw

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IXP4XX_MICROCODE,ixp4xx-microcode,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-build:
	$(CP) $(WRKSRC)/src/npeDl/IxNpeMicrocode.c $(WRKBUILD)
	(cd $(WRKBUILD); \
		$(HOST_CC) IxNpeMicrocode.c -o IxNpeMicrocode; \
		./IxNpeMicrocode -be; \
	);
	
do-install:
	$(INSTALL_DIR) $(IDIR_IXP4XX_MICROCODE)/lib/firmware
	$(INSTALL_BIN) $(WRKBUILD)/NPE-* \
		$(IDIR_IXP4XX_MICROCODE)/lib/firmware

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
