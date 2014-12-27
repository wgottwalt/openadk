# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-audio-scan
PKG_VERSION:=		0.93
PKG_RELEASE:=		1
PKG_HASH:=		5a92f4fce0c5dc3f4f76b2266d484466ff6dfc64340371c392e678324465dc0e
PKG_DESCR:=		metadata and tag reader for all common audio file formats
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl zlib
PKG_BUILDDEP:=		perl zlib
PKG_SITES:=		http://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/

DISTFILES:=             Audio-Scan-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Audio-Scan-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_AUDIO_SCAN,p5-audio-scan,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-fPIC

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-audio-scan-install:
	$(INSTALL_DIR) $(IDIR_P5_AUDIO_SCAN)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_AUDIO_SCAN)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
