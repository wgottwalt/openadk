# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		irqbalance
PKG_VERSION:=		1.0.9
PKG_RELEASE:=		1
PKG_HASH:=		f1b8115948bb9f0bc36b9d7143ee8be751a294bc189d311408e753acc37169c3
PKG_DESCR:=		irq balancing for smp systems
PKG_SECTION:=		sys/utils
PKG_URL:=		https://github.com/Irqbalance/irqbalance
PKG_SITES:=		https://github.com/Irqbalance/irqbalance/archive/

DISTFILES:=             v$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IRQBALANCE,irqbalance,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autogen

irqbalance-install:
	$(INSTALL_DIR) $(IDIR_IRQBALANCE)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/irqbalance \
		$(IDIR_IRQBALANCE)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
