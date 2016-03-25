# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		glib
PKG_VERSION:=		2.48.0
PKG_RELEASE:=		1
PKG_EXTRAVER:=		2.48
PKG_HASH:=		744be6931ca914c68af98dc38ff6b0cf8381d65e335060faddfbf04c17147c34
PKG_DESCR:=		low-level core library that forms the basis of gtk+
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libpcre zlib
PKG_BUILDDEP:=		glib-host libffi gettext-tiny zlib libelf dbus pcre
HOST_BUILDDEP:=		libffi-host gettext-tiny-host python2-host
PKG_NEEDS:=		threads
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://gensho.acc.umu.se/pub/gnome/sources/glib/$(PKG_EXTRAVER)/
PKG_NOPARALLEL:=	1
PKG_OPTS:=		dev noscripts

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GLIB,glib,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,GLIB,glib,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--disable-mem-pools \
			--disable-rebuilds \
			--disable-fam \
			--with-pcre=system \
			--with-threads=posix
CONFIGURE_ENV+=		glib_cv_long_long_format=ll \
			glib_cv_stack_grows=no \
			glib_cv_have_strlcpy=no \
			glib_cv_uscore=no \
			ac_cv_func_posix_getpwuid_r=yes \
			ac_cv_func_posix_getgrgid_r=yes

HOST_STYLE:=		auto
ifneq ($(OS_FOR_BUILD),CYGWIN)
HOST_CFLAGS+=		-fPIC
endif
ifneq ($(OS_FOR_BUILD),Darwin)
HOST_CONFIGURE_ARGS+=	--with-libiconv=no
endif
HOST_CONFIGURE_ARGS+=	--disable-fam \
			--enable-static \
			--with-pcre=bundled \
			--disable-shared \
			--disable-compile-warnings

hostpost-install:
	$(CP) $(STAGING_HOST_DIR)/usr/lib/glib-2.0/include/glibconfig.h \
		$(STAGING_HOST_DIR)/usr/include/glib-2.0/

glib-install:
	$(INSTALL_DIR) $(IDIR_GLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgio*.so* $(IDIR_GLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libglib*.so* $(IDIR_GLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgobject*.so* $(IDIR_GLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgmodule*.so* $(IDIR_GLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgthread*.so* $(IDIR_GLIB)/usr/lib
	# workaround for dev subpackage
	$(INSTALL_DIR) $(IDIR_GLIB_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_GLIB_DEV)/usr/lib/glib-2.0/include
	$(CP) $(WRKINST)/usr/lib/glib-2.0/include/glibconfig.h \
		$(IDIR_GLIB_DEV)/usr/lib/glib-2.0/include
	$(INSTALL_DIR) $(IDIR_GLIB_DEV)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/glib-genmarshal \
		$(IDIR_GLIB_DEV)/usr/bin

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
