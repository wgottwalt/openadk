# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libsigsegv
PKG_VERSION:=		2.11
PKG_RELEASE:=		1
PKG_HASH:=		dd7c2eb2ef6c47189406d562c1dc0f96f2fc808036834d596075d58377e37a18
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
