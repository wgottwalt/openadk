# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		trinity
PKG_VERSION:=		1.6
PKG_RELEASE:=		1
PKG_HASH:=		e40efa320ddc814943e90be0386b5052ce0bbbc457b3f308fa973669d393a6d9
PKG_DESCR:=		linux system call fuzz tester
PKG_SECTION:=		base/tests
PKG_URL:=		http://codemonkey.org.uk/projects/trinity/
PKG_SITES:=		http://codemonkey.org.uk/projects/trinity/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TRINITY,trinity,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

XAKE_FLAGS+=		CROSS_COMPILE=
CONFIG_STYLE:=		minimal
CONFIGURE_PROG:=	configure.sh

trinity-install:
	$(INSTALL_DIR) $(IDIR_TRINITY)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/trinity \
		$(IDIR_TRINITY)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
