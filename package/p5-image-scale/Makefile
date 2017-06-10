# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-image-scale
PKG_VERSION:=		0.13
PKG_RELEASE:=		1
PKG_HASH:=		5b2c92dc2dd635b488879461760cd251aa2b1feef41b64f17914a6e4bbe3e442
PKG_DESCR:=		fast, high-quality fixed-point image resizing
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl libjpeg-turbo zlib libpng giflib
PKG_BUILDDEP:=		perl-host perl libjpeg-turbo zlib libpng giflib
PKG_SITES:=		http://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/

DISTFILES:=             Image-Scale-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Image-Scale-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_IMAGE_SCALE,p5-image-scale,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)
CONFIGURE_ARGS+=	--with-jpeg-includes=${STAGING_TARGET_DIR}/usr/include \
			--with-jpeg-libs=${STAGING_TARGET_DIR}/usr/lib \
			--with-png-includes=${STAGING_TARGET_DIR}/usr/include \
			--with-png-libs=${STAGING_TARGET_DIR}/usr/lib \
			--with-gif-includes=${STAGING_TARGET_DIR}/usr/include \
			--with-gif-libs=${STAGING_TARGET_DIR}/usr/lib

p5-image-scale-install:
	$(INSTALL_DIR) $(IDIR_P5_IMAGE_SCALE)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_IMAGE_SCALE)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
