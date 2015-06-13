# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-image-scale
PKG_VERSION:=		0.08
PKG_RELEASE:=		1
PKG_HASH:=		e2dcc90b9954a43dafc7f61bc6dc472382eb719b1046247da5a93cfdd7c3b3e0
PKG_DESCR:=		fast, high-quality fixed-point image resizing
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl libjpeg-turbo zlib libpng
PKG_BUILDDEP:=		perl libjpeg-turbo zlib libpng
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
			--with-png-libs=${STAGING_TARGET_DIR}/usr/lib

p5-image-scale-install:
	$(INSTALL_DIR) $(IDIR_P5_IMAGE_SCALE)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_IMAGE_SCALE)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
