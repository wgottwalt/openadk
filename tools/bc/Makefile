# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bc
PKG_VERSION:=		1.06
PKG_RELEASE:=		1
PKG_MD5SUM:=		d44b5dddebd8a7a7309aea6c36fda117
PKG_SITES:=		http://ftp.gnu.org/pub/gnu/bc/

include ../rules.mk

install: ${BIN_DIR}/bc

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; ./configure)
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}'
	touch $@

${BIN_DIR}/bc: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/bc/bc \
		${BIN_DIR}

include $(TOPDIR)/mk/tools.mk
