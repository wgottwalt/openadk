# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		qemu
PKG_VERSION:=		0.14.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		b6c713a8db638e173af53a62d5178640
PKG_SITES:=		http://download.savannah.gnu.org/releases/qemu/

include ../rules.mk

install: ${STAGING_JAVA_HOST_DIR}/usr/bin/qemu-arm

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd $(WRKBUILD); ./configure --prefix=/usr \
				--host-cc=$(CC_FOR_BUILD) \
				--disable-system \
				--disable-sdl \
				--target-list=arm-linux-user \
	)
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	${MAKE} -C ${WRKBUILD} $(MAKE_TRACE)
	touch $@

${STAGING_JAVA_HOST_DIR}/usr/bin/qemu-arm: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} DESTDIR=$(STAGING_JAVA_HOST_DIR) install $(MAKE_TRACE)

include $(TOPDIR)/mk/tools.mk
