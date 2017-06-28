# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		userspace-rcu
PKG_VERSION:=		0.9.2
PKG_RELEASE:=		1
PKG_HASH:=		8f7fa313b1e0a3f742cea24ce63a39c0efe63e615a769e2961e55bd2663ecaa3
PKG_DESCR:=		userspace rcu library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://lttng.org/
PKG_SITES:=		http://lttng.org/files/urcu/
PKG_LIBNAME:=		liburcu
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBURCU,liburcu,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes

liburcu-install:
	$(INSTALL_DIR) $(IDIR_LIBURCU)/usr/lib
	$(CP) $(WRKINST)/usr/lib/liburcu*.so* \
		$(IDIR_LIBURCU)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
