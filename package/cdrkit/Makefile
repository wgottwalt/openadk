# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		cdrkit
PKG_VERSION:=		1.1.11
PKG_RELEASE:=		1
PKG_HASH:=		d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da
PKG_DESCR:=		cd burning kit
PKG_SECTION:=		sys/hw
PKG_DEPENDS:=		libmagic zlib libbz2 libcap
PKG_BUILDDEP:=		cmake-host file zlib bzip2 libcap
PKG_SITES:=		http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit/

PKG_BUILDDEP_UCLIBC:=	libiconv-tiny
PKG_BUILDDEP_UCLIBC_NG:=libiconv-tiny

DISTFILES:=             $(PKG_NAME)_$(PKG_VERSION).orig.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CDRKIT,cdrkit,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=          cmake
CMAKE_FLAGS+=		-DUSE_LIBC_NLS=1 -DUSE_LIBXNET=0 -DUSE_LIBNLS=0

ifeq ($(ADK_TARGET_ENDIAN),little)
CMAKE_FLAGS+=		-DBITFIELDS_HTOL=0
else
CMAKE_FLAGS+=		-DBITFIELDS_HTOL=1
endif

cdrkit-install:
	$(INSTALL_DIR) $(IDIR_CDRKIT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_CDRKIT)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
