# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fftw
PKG_VERSION:=		3.3.4
PKG_RELEASE:=		1
PKG_HASH:=		8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982
PKG_DESCR:=		fftw fourier lib
PKG_SECTION:=		libs/audio
PKG_URL:=		http://www.fftw.org
PKG_SITES:=		http://www.fftw.org/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

$(eval $(call PKG_template,FFTW,fftw,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

do-configure:
	mkdir -p $(WRKBUILD)/single
	mkdir -p $(WRKBUILD)/double
	cd $(WRKBUILD)/single && $(WRKSRC)/configure $(CONFIGURE_TRIPLE) --prefix=/usr --enable-shared --enable-float
	cd $(WRKBUILD)/double && $(WRKSRC)/configure $(CONFIGURE_TRIPLE) --prefix=/usr --enable-shared

do-build:
	cd $(WRKBUILD)/single && make
	cd $(WRKBUILD)/double && make

do-install:
	cd $(WRKBUILD)/single && make DESTDIR='${WRKINST}' install
	cd $(WRKBUILD)/double && make DESTDIR='${WRKINST}' install

fftw-install:
	$(INSTALL_DIR) $(IDIR_FFTW)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfftw*.so* \
		$(IDIR_FFTW)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
