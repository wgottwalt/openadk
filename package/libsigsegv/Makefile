# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libsigsegv
PKG_VERSION:=		2.10
PKG_RELEASE:=		1
PKG_HASH:=		8460a4a3dd4954c3d96d7a4f5dd5bc4d9b76f5754196aa245287553b26d2199a
PKG_DESCR:=		handling page faults in user mode
PKG_SECTION:=		libs/misc
PKG_URL:=		https://www.gnu.org/software/libsigsegv/
PKG_SITES:=		http://ftp.gnu.org/gnu/libsigsegv/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSIGSEGV,libsigsegv,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ENV+=		sv_cv_fault_posix=yes

libsigsegv-install:
	$(INSTALL_DIR) $(IDIR_LIBSIGSEGV)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsigsegv*.so* \
		$(IDIR_LIBSIGSEGV)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
