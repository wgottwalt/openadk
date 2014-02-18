# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gperf
PKG_VERSION:=		3.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c1f1db32fb6598d6a93e6e88796a8632
PKG_SITES:=		http://ftp.gnu.org/pub/gnu/gperf/

include ../rules.mk

install: ${BIN_DIR}/gperf

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; ./configure)
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}'
	touch $@

${BIN_DIR}/gperf: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/src/gperf \
		${BIN_DIR}

include $(TOPDIR)/mk/tools.mk
