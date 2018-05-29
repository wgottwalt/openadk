# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		irqbalance
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_HASH:=		62de71510a2496fcf027efb0b288dd48e53e9efc931fa573c95580cad6264d07
PKG_DESCR:=		irq balancing for smp systems
PKG_SECTION:=		sys/utils
PKG_DEPENDS:=		glib
PKG_BUILDDEP:=		glib
PKG_URL:=		https://github.com/Irqbalance/irqbalance
PKG_SITES:=		https://github.com/Irqbalance/irqbalance/archive/

DISTFILES:=             v$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IRQBALANCE,irqbalance,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

TARGET_LDFLAGS+=	-ltinfo
AUTOTOOL_STYLE:=	autogen

irqbalance-install:
	$(INSTALL_DIR) $(IDIR_IRQBALANCE)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/irqbalance \
		$(IDIR_IRQBALANCE)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
