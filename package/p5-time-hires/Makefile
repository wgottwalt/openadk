# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-time-hires
PKG_VERSION:=		1.9726
PKG_RELEASE:=		1
PKG_HASH:=		ff662ad9b1f6c75a149db7fa1bfc7a161ac8b271e5f3980345e08b734769109e
PKG_DESCR:=		high resolution alarm, sleep, gettimeofday, interval timers
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl librt libpthread
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/

DISTFILES:=             Time-HiRes-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Time-HiRes-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_TIME_HIRES,p5-time-hires,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-time-hires-install:
	$(INSTALL_DIR) $(IDIR_P5_TIME_HIRES)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_TIME_HIRES)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
