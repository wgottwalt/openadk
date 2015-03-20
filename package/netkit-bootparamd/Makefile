# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		netkit-bootparamd
PKG_VERSION:=		0.17
PKG_RELEASE:=		1
PKG_HASH:=		7fd44b14f7ee5bf930bdd03b0c3a15bdb6efb60a862af47269b05361c4ed395c
PKG_DESCR:=		net bootparam daemon
PKG_SECTION:=		net/misc
PKG_BUILDDEP:=		libtirpc
PKG_SITES:=		http://www.openadk.org/distfiles/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NETKIT_BOOTPARAMD,netkit-bootparamd,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/tirpc
TARGET_LDFLAGS+=	-ltirpc

do-configure:
	echo "BINDIR=/usr/bin" > $(WRKBUILD)/MCONFIG
	echo "SBINDIR=/usr/sbin" >> $(WRKBUILD)/MCONFIG
	echo "MANDIR=/usr/share/man" >> $(WRKBUILD)/MCONFIG
	echo "PREFIX=$PREFIX" >> $(WRKBUILD)/MCONFIG
	echo "EXECPREFIX=$EXECPREFIX" >> $(WRKBUILD)/MCONFIG
	echo "INSTALLROOT=$(WRKINST)" >> $(WRKBUILD)/MCONFIG
	echo "CC=$(TARGET_CC)" >> $(WRKBUILD)/MCONFIG
	echo "CFLAGS=$(TARGET_CFLAGS)" >> $(WRKBUILD)/MCONFIG
	echo "CPPFLAGS=$(TARGET_CPPFLAGS)" >> $(WRKBUILD)/MCONFIG
	echo "LDFLAGS=$(TARGET_LDFLAGS)" >> $(WRKBUILD)/MCONFIG

netkit-bootparamd-install:
	$(INSTALL_DIR) $(IDIR_NETKIT_BOOTPARAMD)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/rpc.bootparamd \
		$(IDIR_NETKIT_BOOTPARAMD)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
