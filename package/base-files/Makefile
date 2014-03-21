# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/rootfs.mk

PKG_NAME:=		base-files
PKG_VERSION:=		1.0
PKG_RELEASE:=		76
PKG_SECTION:=		base
PKG_DESCR:=		basic files and scripts
PKG_BUILDDEP:=		pkgconf-host file-host

WRKDIST=		${WRKDIR}/base-files
NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BASE_FILES,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},force_etc))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(CP) ./src/* $(IDIR_BASE_FILES)
ifeq (${ADK_TARGET_ROOTFS_NFSROOT},y)
	@echo "#" > $(IDIR_BASE_FILES)/etc/network/interfaces
endif
	$(SED) 's,@ARCH@,$(ADK_TARGET_CPU_ARCH),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	$(SED) 's,@SYSTEM@,$(ADK_TARGET_SYSTEM),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	$(SED) 's,@LIBC@,$(ADK_TARGET_LIBC),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	$(SED) 's,@HOST@,$(ADK_HOST),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	$(SED) 's,@VENDOR@,$(ADK_VENDOR),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	echo /bin/sh >${IDIR_BASE_FILES}/etc/shells
	echo /bin/mksh >>${IDIR_BASE_FILES}/etc/shells
ifneq (${ADK_PACKAGE_ASH},)
	echo /bin/ash >>${IDIR_BASE_FILES}/etc/shells
endif
ifneq (${ADK_PACKAGE_BASH},)
	echo /bin/bash >>${IDIR_BASE_FILES}/etc/shells
endif
ifneq (${ADK_PACKAGE_ZSH},)
	echo /bin/zsh >>${IDIR_BASE_FILES}/etc/shells
endif
	mkdir -p $(IDIR_BASE_FILES)/usr/lib/ipkg/lists
	mkdir -p $(IDIR_BASE_FILES)/etc/crontabs
	mkdir -p $(IDIR_BASE_FILES)/{dev,boot,root,sys,proc,tmp,mnt}
	mkdir -p $(IDIR_BASE_FILES)/etc/network/{if-pre-up.d,if-up.d,if-down.d,if-post-down.d}
	mkdir -p $(IDIR_BASE_FILES)/usr/{lib,bin}
	chmod 755 $(IDIR_BASE_FILES)/lib/mdev/init
	chmod 600 $(IDIR_BASE_FILES)/etc/shadow
	chmod 600 $(IDIR_BASE_FILES)/etc/network/interfaces
	chmod 1777 ${IDIR_BASE_FILES}/tmp
	ln -sf ../proc/mounts $(IDIR_BASE_FILES)/etc/mtab
	rm -rf $(IDIR_BASE_FILES)/var
	ln -sf tmp $(IDIR_BASE_FILES)/var
	test -z $(ADK_RUNTIME_SHELL) || \
	    cat ./files/inittab.shell >> $(IDIR_BASE_FILES)/etc/inittab
	test -z $(ADK_RUNTIME_GETTY_VGA) || \
	    cat ./files/inittab.vga >> $(IDIR_BASE_FILES)/etc/inittab
	test -z $(ADK_RUNTIME_GETTY_SERIAL) || \
	    cat ./files/inittab.serial >> $(IDIR_BASE_FILES)/etc/inittab
	$(SED) 's#@DEVICE@#$(ADK_RUNTIME_CONSOLE_SERIAL_DEVICE)#g' $(IDIR_BASE_FILES)/etc/inittab
	$(SED) 's#@SPEED@#$(ADK_RUNTIME_CONSOLE_SERIAL_SPEED)#' $(IDIR_BASE_FILES)/etc/inittab
	test -z $(ADK_RUNTIME_HOSTNAME) || \
	    echo $(ADK_RUNTIME_HOSTNAME) > $(IDIR_BASE_FILES)/etc/hostname; \
	    echo "127.0.0.1	localhost" > $(IDIR_BASE_FILES)/etc/hosts
	    echo "::1		localhost" >> $(IDIR_BASE_FILES)/etc/hosts
	    echo "127.0.1.1	$(ADK_RUNTIME_HOSTNAME)" >> $(IDIR_BASE_FILES)/etc/hosts
	test -z $(ADK_RUNTIME_PASSWORD) || \
	    $(SED) 's,\*NP\*,'"$$($(STAGING_HOST_DIR)/usr/bin/mkcrypt \
	    ${ADK_RUNTIME_PASSWORD}),g" $(IDIR_BASE_FILES)/etc/shadow
	git log -1|head -1|sed -e 's#commit ##' \
		> $(IDIR_BASE_FILES)/etc/adkversion
	test -z $(ADK_TARGET_SYSTEM) || \
	    echo $(ADK_TARGET_SYSTEM) > $(IDIR_BASE_FILES)/etc/adktarget
	echo $(ADK_RUNTIME_TMPFS_SIZE) > $(IDIR_BASE_FILES)/etc/tmpfs
ifneq (${ADK_PACKAGE_CONFIG_IN_ETC},)
	gzip -9c ${TOPDIR}/.config >$(IDIR_BASE_FILES)/etc/adkconfig.gz
	chmod 600 $(IDIR_BASE_FILES)/etc/adkconfig.gz
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
	echo 'export LD_LIBRARY_PATH=/opt/vc/lib' >> $(IDIR_BASE_FILES)/etc/profile
ifneq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI)$(ADK_TARGET_SYSTEM_IBM_X40)$(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),)
	echo 'export IPKGTMPDIR=/root/.ipkg' >> $(IDIR_BASE_FILES)/etc/profile
else
	echo 'export IPKGTMPDIR=/tmp >> $(IDIR_BASE_FILES)/etc/profile
endif

endif

# simple network configuration
ifneq (${ADK_SIMPLE_NETWORK_CONFIG},)
	${INSTALL_DIR} ${IDIR_BASE_FILES}/etc/network

	# network config local
	echo -e "auto lo\niface lo inet loopback" > ${IDIR_BASE_FILES}/etc/network/interfaces

	# network config eth0
	# configure nic with dhcp
ifeq (${SIMPLE_NETWORK_CONFIG_ETH0_TYPE_NIC},y)
	echo -e "\nauto eth0\niface eth0 inet dhcp" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif
	# configure nic with manual ip
ifeq (${SIMPLE_NETWORK_CONFIG_ETH0_TYPE_NIC_MANUAL},y)
	echo -e "\nauto eth0\niface eth0 inet static" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  address ${SIMPLE_NETWORK_CONFIG_ETH0_IP}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  netmask ${SIMPLE_NETWORK_CONFIG_ETH0_NM}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  broadcast ${SIMPLE_NETWORK_CONFIG_ETH0_BC}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  gateway ${SIMPLE_NETWORK_CONFIG_ETH0_GW}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif
	# configure bridge
ifeq (${SIMPLE_NETWORK_CONFIG_ETH0_TYPE_BRIDGE},y)
	echo -e "\nauto br0\niface br0 inet manual" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  bridge-ports ${SIMPLE_NETWORK_CONFIG_ETH0_BRIDGE}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif
	#configure bridge with ip
ifeq (${SIMPLE_NETWORK_CONFIG_ETH0_TYPE_BRIDGE_IP},y)
	echo -e "\nauto br0\niface br0 inet static" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  address ${SIMPLE_NETWORK_CONFIG_ETH0_IP}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  netmask ${SIMPLE_NETWORK_CONFIG_ETH0_NM}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  broadcast ${SIMPLE_NETWORK_CONFIG_ETH0_BC}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  bridge-ports ${SIMPLE_NETWORK_CONFIG_ETH0_BRIDGE}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif

	# network config wlan0
ifeq (${SIMPLE_NETWORK_CONFIG_WLAN0_TYPE_NIC},y)
	echo -e "\nauto wlan0\niface wlan0 inet dhcp" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif

	# network config eth1
	# configure nic with dhcp
ifeq (${SIMPLE_NETWORK_CONFIG_ETH1_TYPE_NIC},y)
	echo -e "\nauto eth1\niface eth1 inet dhcp" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif
	# configure nic with manual ip
ifeq (${SIMPLE_NETWORK_CONFIG_ETH1_TYPE_NIC_MANUAL},y)
	echo -e "\nauto eth1\niface eth1 inet static" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  address ${SIMPLE_NETWORK_CONFIG_ETH1_IP}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  netmask ${SIMPLE_NETWORK_CONFIG_ETH1_NM}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  broadcast ${SIMPLE_NETWORK_CONFIG_ETH1_BC}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  gateway ${SIMPLE_NETWORK_CONFIG_ETH1_GW}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif
	# configure bridge
ifeq (${SIMPLE_NETWORK_CONFIG_ETH1_TYPE_BRIDGE},y)
	echo -e "\nauto br0\niface br1 inet manual" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  bridge-ports ${SIMPLE_NETWORK_CONFIG_ETH1_BRIDGE}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif
	#configure bridge with ip
ifeq (${SIMPLE_NETWORK_CONFIG_ETH1_TYPE_BRIDGE_IP},y)
	echo -e "\nauto br0\niface br1 inet static" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  address ${SIMPLE_NETWORK_CONFIG_ETH1_IP}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  netmask ${SIMPLE_NETWORK_CONFIG_ETH1_NM}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  broadcast ${SIMPLE_NETWORK_CONFIG_ETH1_BC}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
	echo -e "  bridge-ports ${SIMPLE_NETWORK_CONFIG_ETH1_BRIDGE}" >> ${IDIR_BASE_FILES}/etc/network/interfaces
endif

	# newline at the end of interfaces file
	echo -en "\n" >>  ${IDIR_BASE_FILES}/etc/network/interfaces

	# resolver config
	echo -e "nameserver ${SIMPLE_NETWORK_CONFIG_RESOLV}" > ${IDIR_BASE_FILES}/etc/resolv.conf
endif


include ${TOPDIR}/mk/pkg-bottom.mk
