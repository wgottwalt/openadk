# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/rootfs.mk

PKG_NAME:=		base-files
PKG_VERSION:=		1.0
PKG_RELEASE:=		7
PKG_DESCR:=		basic filesystem structure and scripts
PKG_SECTION:=		base

WRKDIST=		${WRKDIR}/base-files
NO_DISTFILES:=		1
ifeq ($(CPU_ARCH),x86_64)
PKG_ID=			x86-64-${FS}
else
PKG_ID=			${ADK_TARGET}-${FS}
endif
WRKDIR=			${WRKDIR_BASE}/w-${PKG_NAME}-${PKG_VERSION}-${PKG_RELEASE}-${PKG_ID}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BASE_FILES,base-files-${PKG_ID},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

do-install:
	$(CP) ./extra/* $(IDIR_BASE_FILES)
	$(CP) $(TOPDIR)/target/$(ADK_TARGET)/files/* $(IDIR_BASE_FILES)
	$(SED) 's,@TARGET@,$(ADK_TARGET),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
	$(SED) 's,@VERSION@,$(ADK_VERSION),g' $(IDIR_BASE_FILES)/etc/ipkg.conf
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
	mkdir -p $(IDIR_BASE_FILES)/mnt
	mkdir -p $(IDIR_BASE_FILES)/proc
	mkdir -p $(IDIR_BASE_FILES)/tmp
	mkdir -p $(IDIR_BASE_FILES)/usr/lib
	mkdir -p $(IDIR_BASE_FILES)/usr/bin
	chmod 755 $(IDIR_BASE_FILES)/lib/mdev/init
	chmod 600 $(IDIR_BASE_FILES)/etc/shadow
	ln -sf ../tmp/resolv.conf $(IDIR_BASE_FILES)/etc/resolv.conf
	ln -sf ../proc/mounts $(IDIR_BASE_FILES)/etc/mtab
	rm -rf $(IDIR_BASE_FILES)/var
	ln -sf tmp $(IDIR_BASE_FILES)/var
ifneq (${ADK_PACKAGE_CONFIG_IN_ETC},)
	gzip -9c ${TOPDIR}/.config >$(IDIR_BASE_FILES)/etc/adkconfig.gz
endif

include ${TOPDIR}/mk/pkg-bottom.mk
