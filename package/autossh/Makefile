# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		autossh
PKG_VERSION:=		1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		0e7ec62eeca5d1b197f3ef2d0f0d417f
MASTER_SITES:=		http://www.harding.motd.ca/autossh/
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tgz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUTOSSH,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

TCFLAGS+=		-Wall -DSSH_PATH=\\\"/usr/bin/ssh\\\"\ \
			-DVER=\\\"$(PKG_VERSION)\\\"\"
MAKE_FLAGS+=		CC="$(TARGET_CC)" BINDIR=/usr/bin MANDIR=/usr/man
BUILD_STYLE=		auto

do-configure:
	cp $(WRKBUILD)/Makefile.linux $(WRKBUILD)/Makefile

do-install:
	echo $(CC)
	$(INSTALL_DIR) $(IDIR_AUTOSSH)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/autossh $(IDIR_AUTOSSH)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
