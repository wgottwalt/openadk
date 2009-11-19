# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mac80211
PKG_VERSION:=		2009-05-01
PKG_RELEASE:=		1
PKG_MD5SUM:=		abc949ec3f7cc57302cca814d9b9c6cd
PKG_DESCR:=		Linux wireless framework (SoftMAC)
PKG_SECTION:=		kernel
PKG_URL:=		http://wireless.kernel.org
PKG_SITES:=		http://www.orbit-lab.org/kernel/compat-wireless-2.6/2009/05/	\
			http://wireless.kernel.org/download/compat-wireless-2.6/

PKG_DESCR_1:=		ath5k driver
PKG_DESCR_2:=		rt61/rt2x00 driver

DISTFILES:=		compat-wireless-${PKG_VERSION}.tar.bz2
WRKDIST=		${WRKDIR}/compat-wireless-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,KMOD_MAC80211,kmod-mac80211,${KERNEL_VERSION}+${PKG_VERSION}-${TARGET}-${PKG_RELEASE},kernel ${KERNEL_VERSION}--${KERNEL_RELEASE},${PKG_DESCR},{PKG_SECTION}))
$(eval $(call PKG_template,KMOD_MAC80211_ATH5K,kmod-mac80211-ath5k,${KERNEL_VERSION}+${PKG_VERSION}-${TARGET}-${PKG_RELEASE},kernel ${KERNEL_VERSION}--${KERNEL_RELEASE},${PKG_DESCR},{PKG_SECTION}))
$(eval $(call PKG_template,KMOD_MAC80211_RT61,kmod-mac80211-rt61,${KERNEL_VERSION}+${PKG_VERSION}-${TARGET}-${PKG_RELEASE},kernel ${KERNEL_VERSION}--${KERNEL_RELEASE},${PKG_DESCR},{PKG_SECTION}))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		manual

# remove entry to enable driver compilation
DISABLED_DRIVERS:=	CONFIG_AR9170_USB=n \
			CONFIG_MAC80211_HWSIM=n \
			CONFIG_ATH9K=n \
			CONFIG_IWLWIFI=n \
			CONFIG_IWLAGN=n \
			CONFIG_IWL4965=n \
 			CONFIG_IWL5000=n \
			CONFIG_IWL3945=n \
			CONFIG_B43=n \
			CONFIG_B43LEGACY=n \
			CONFIG_LIBIPW=n \
			CONFIG_IPW2100=n \
			CONFIG_IPW2200=n \
			CONFIG_P54_PCI=n \
			CONFIG_B44=n \
			CONFIG_RTL8180=n \
			CONFIG_ADM8211=n \
			CONFIG_RT2800PCI=n \
			CONFIG_ATMEL=n \
			CONFIG_PCI_ATMEL=n \
			CONFIG_ZD1211RW=n \
			CONFIG_P54_USB=n \
			CONFIG_RTL8187=n \
			CONFIG_AT76C50X_USB=n \
			CONFIG_RT2500USB=n \
			CONFIG_RT2800USB=n \
			CONFIG_RT2X00_LIB_USB=n \
			CONFIG_RT73USB=n \
			CONFIG_P54_COMMON=n \
			CONFIG_SSB=n \
			CONFIG_LIBERTAS_USB=n \
			CONFIG_LIBERTAS_CS=n \
			CONFIG_LIBERTAS=n \
			CONFIG_MWL8K=n \
			CONFIG_USB_NET_CDCETHER=n \
			CONFIG_USB_NET_RNDIS_HOST=n \
			CONFIG_USB_NET_RNDIS_WLAN=n

BUILD_STYLE:=		manual

do-build:
	ARCH="${ARCH}" \
	CROSS_COMPILE="${TARGET_CROSS}" \
	KLIB_BUILD="$(LINUX_DIR)" \
	KLIB="${WRKINST}/lib/modules/${KERNEL_VERSION}" \
	MODPROBE=: \
	LDFLAGS="" \
	${DISABLED_DRIVERS} \
	V=1 \
	$(MAKE) -C ${WRKBUILD}/

do-install:
	${INSTALL_DIR} ${IDIR_KMOD_MAC80211}/etc/modules.d/
	${INSTALL_DIR} ${IDIR_KMOD_MAC80211}/lib/modules/${KERNEL_VERSION}/
	${CP} ${WRKBUILD}/net/wireless/{cfg80211,lib80211,lib80211*}.ko \
		${IDIR_KMOD_MAC80211}/lib/modules/${KERNEL_VERSION}/
	${CP} ${WRKBUILD}/net/mac80211/mac80211.ko \
		${IDIR_KMOD_MAC80211}/lib/modules/${KERNEL_VERSION}/
	echo "lib80211" > ${IDIR_KMOD_MAC80211}/etc/modules.d/20-mac80211
	echo "lib80211_crypt_ccmp" >> ${IDIR_KMOD_MAC80211}/etc/modules.d/20-mac80211
	echo "cfg80211" >> ${IDIR_KMOD_MAC80211}/etc/modules.d/20-mac80211
	echo "mac80211" >> ${IDIR_KMOD_MAC80211}/etc/modules.d/20-mac80211
	# driver for ath5k
	${INSTALL_DIR} ${IDIR_KMOD_MAC80211_ATH5K}/etc/modules.d/
	${INSTALL_DIR} ${IDIR_KMOD_MAC80211_ATH5K}/lib/modules/${KERNEL_VERSION}/
	${CP} ${WRKBUILD}/drivers/net/wireless/ath/ath.ko \
		${IDIR_KMOD_MAC80211_ATH5K}/lib/modules/${KERNEL_VERSION}/
	${CP} ${WRKBUILD}/drivers/net/wireless/ath/ath5k/ath5k.ko \
		${IDIR_KMOD_MAC80211_ATH5K}/lib/modules/${KERNEL_VERSION}/
	echo "ath" > ${IDIR_KMOD_MAC80211_ATH5K}/etc/modules.d/30-ath5k
	echo "ath5k" >> ${IDIR_KMOD_MAC80211_ATH5K}/etc/modules.d/30-ath5k
	# driver for rt61
	${INSTALL_DIR} ${IDIR_KMOD_MAC80211_RT61}/etc/modules.d/
	${INSTALL_DIR} ${IDIR_KMOD_MAC80211_RT61}/lib/modules/${KERNEL_VERSION}/
	${CP} ${WRKBUILD}/drivers/misc/eeprom/eeprom_93cx6.ko \
		${IDIR_KMOD_MAC80211_RT61}/lib/modules/${KERNEL_VERSION}/
	${CP} ${WRKBUILD}/drivers/net/wireless/rt2x00/rt2x00*.ko \
		${IDIR_KMOD_MAC80211_RT61}/lib/modules/${KERNEL_VERSION}/
	${CP} ${WRKBUILD}/drivers/net/wireless/rt2x00/rt61pci.ko \
		${IDIR_KMOD_MAC80211_RT61}/lib/modules/${KERNEL_VERSION}/
	echo "eeprom_93cx6" > ${IDIR_KMOD_MAC80211_RT61}/etc/modules.d/30-rt61
	echo "rt2x00lib" >> ${IDIR_KMOD_MAC80211_RT61}/etc/modules.d/30-rt61
	echo "rt2x00pci" >> ${IDIR_KMOD_MAC80211_RT61}/etc/modules.d/30-rt61
	echo "rt61pci" >> ${IDIR_KMOD_MAC80211_RT61}/etc/modules.d/30-rt61

include ${TOPDIR}/mk/pkg-bottom.mk
