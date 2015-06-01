# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libcap
PKG_VERSION:=		2.24
PKG_RELEASE:=		1
PKG_HASH:=		cee4568f78dc851d726fc93f25f4ed91cc223b1fe8259daa4a77158d174e6c65
PKG_DESCR:=		capabilities library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.friedhoff.org/posixfilecaps.html
PKG_SITES:=		https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCAP,libcap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

# for Darwin hosts
CPPFLAGS_FOR_BUILD+=	-I$(STAGING_TARGET_DIR)/usr/include
CONFIG_STYLE:=		manual

ifeq ($(ADK_TARGET_USE_STATIC_LIBS),y)
ALL_TARGET:=		static progs
INSTALL_TARGET:=	install-static
else
ALL_TARGET:=		shared progs
INSTALL_TARGET:=	install-shared
endif

libcap-install:
	$(INSTALL_DIR) $(IDIR_LIBCAP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcap*.so* \
		$(IDIR_LIBCAP)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
