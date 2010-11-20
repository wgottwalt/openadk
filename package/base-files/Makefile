# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/rootfs.mk

PKG_NAME:=		base-files
PKG_VERSION:=		1.0
PKG_RELEASE:=		30
PKG_SECTION:=		base
PKG_DESCR:=		basic files and scripts

WRKDIST=		${WRKDIR}/base-files
NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BASE_FILES,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(CP) ./src/* $(IDIR_BASE_FILES)
	# allow this to fail, as there might be no target-specific files to copy
	-$(CP) $(TOPDIR)/target/$(ADK_TARGET)/files/* $(IDIR_BASE_FILES)
ifeq (${ADK_TARGET_ROOTFS_NFSROOT},y)
	@-rm $(IDIR_BASE_FILES)/etc/network/interfaces
endif
	$(SED) 's,@TARGET@,$(ADK_TARGET),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	$(SED) 's,@HOST@,$(ADK_HOST),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	$(SED) 's,@LIBC@,$(ADK_LIBC),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	$(SED) 's,@VENDOR@,$(ADK_VENDOR),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	echo /bin/sh >${IDIR_BASE_FILES}/etc/shells
	echo /bin/ash >>${IDIR_BASE_FILES}/etc/shells
ifneq (${ADK_PACKAGE_BASH},)
	echo /bin/bash >>${IDIR_BASE_FILES}/etc/shells
endif
ifneq (${ADK_PACKAGE_MKSH},)
	echo /bin/mksh >>${IDIR_BASE_FILES}/etc/shells
endif
ifneq (${ADK_PACKAGE_ZSH},)
	echo /bin/zsh >>${IDIR_BASE_FILES}/etc/shells
endif
	mkdir -p $(IDIR_BASE_FILES)/dev
	mkdir -p $(IDIR_BASE_FILES)/boot
	mkdir -p $(IDIR_BASE_FILES)/root
	mkdir -p $(IDIR_BASE_FILES)/sys
	mkdir -p $(IDIR_BASE_FILES)/etc/crontabs
	mkdir -p $(IDIR_BASE_FILES)/etc/network/if-pre-up.d
	mkdir -p $(IDIR_BASE_FILES)/etc/network/if-up.d
	mkdir -p $(IDIR_BASE_FILES)/etc/network/if-down.d
	mkdir -p $(IDIR_BASE_FILES)/etc/network/if-post-down.d
	mkdir -p $(IDIR_BASE_FILES)/mnt
	mkdir -p $(IDIR_BASE_FILES)/proc
	mkdir -p $(IDIR_BASE_FILES)/tmp
	mkdir -p $(IDIR_BASE_FILES)/usr/lib
	mkdir -p $(IDIR_BASE_FILES)/usr/bin
	chmod 755 $(IDIR_BASE_FILES)/lib/mdev/init
	chmod 600 $(IDIR_BASE_FILES)/etc/shadow
	ln -sf ../proc/mounts $(IDIR_BASE_FILES)/etc/mtab
	rm -rf $(IDIR_BASE_FILES)/var
	ln -sf tmp $(IDIR_BASE_FILES)/var
	test -z $(ADK_RUNTIME_HOSTNAME) || \
	    echo $(ADK_RUNTIME_HOSTNAME) > \
	    $(IDIR_BASE_FILES)/etc/hostname
	test -z $(ADK_RUNTIME_PASSWORD) || \
	    $(SED) 's,\*NP\*,'"$$(${TOPDIR}/bin/tools/mkcrypt \
	    ${ADK_RUNTIME_PASSWORD}),g" $(IDIR_BASE_FILES)/etc/shadow
	git log -1|head -1|sed -e 's#commit ##' \
		> $(IDIR_BASE_FILES)/etc/adkversion
	test -z $(ADK_TARGET) || \
	    echo $(ADK_TARGET) > $(IDIR_BASE_FILES)/etc/adktarget
ifneq (${ADK_PACKAGE_CONFIG_IN_ETC},)
	gzip -9c ${TOPDIR}/.config >$(IDIR_BASE_FILES)/etc/adkconfig.gz
	chmod 600 $(IDIR_BASE_FILES)/etc/adkconfig.gz
endif

include ${TOPDIR}/mk/pkg-bottom.mk
