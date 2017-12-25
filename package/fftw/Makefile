# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fftw
PKG_VERSION:=		3.3.7
PKG_RELEASE:=		1
PKG_HASH:=		3b609b7feba5230e8f6dd8d245ddbefac324c5a6ae4186947670d9ac2cd25573
PKG_DESCR:=		fftw fourier lib
PKG_SECTION:=		libs/audio
PKG_URL:=		http://www.fftw.org
PKG_SITES:=		http://www.fftw.org/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FFTW,fftw,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

CONFIGURE_ARGS:=	--enable-threads

ifeq ($(ADK_TARGET_ARCH_ARM_WITH_NEON),y)
CONFIGURE_ARGS+=	--enable-neon --with-slow-timer
endif

do-configure:
	mkdir -p $(WRKBUILD)/single
	mkdir -p $(WRKBUILD)/double
	cd $(WRKBUILD)/single && $(WRKSRC)/configure $(CONFIGURE_TRIPLE) --prefix=/usr --enable-shared --enable-float $(CONFIGURE_ARGS)
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
