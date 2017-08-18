# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		logitechmediaserver
PKG_VERSION:=		7.9.1
PKG_EXTRAVER:=		1502887423-noCPAN
PKG_RELEASE:=		1
PKG_HASH:=		dfc803d31129ef55e3bbd1db34349d7ac31bbc261fcdb78246c895dcbbb4bf2d
PKG_DESCR:=		popular media server
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		perl p5-xml-parser p5-dbi p5-ev p5-html-parser
PKG_DEPENDS+=		p5-json-xs p5-digest-sha1 p5-yaml-xs p5-sub-name
PKG_DEPENDS+=		p5-xml-parser-expat p5-common-sense
PKG_DEPENDS+=		p5-types-serialiser p5-audio-scan p5-image-scale
PKG_DEPENDS+=		p5-dbd-sqlite p5-tie-refhash p5-template-toolkit
PKG_DEPENDS+=		p5-class-xsaccessor p5-io-interface p5-anyevent
PKG_BUILDDEP:=		perl
PKG_URL:=		http://wiki.slimdevices.com/index.php/Logitech_Media_Server
PKG_SITES:=		http://downloads.slimdevices.com/nightly/7.9/sc/03ab5b5/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-${PKG_EXTRAVER}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-${PKG_EXTRAVER}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LOGITECHMEDIASERVER,logitechmediaserver,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

post-extract:
	rm -rf ${WRKBUILD}/CPAN/Class/XSAccessor*
	rm -rf ${WRKBUILD}/CPAN/Template*
	rm -rf ${WRKBUILD}/CPAN/HTML*
	rm -rf ${WRKBUILD}/CPAN/DBI/
	rm -rf ${WRKBUILD}/CPAN/DBI.pm
	rm -rf ${WRKBUILD}/CPAN/IO/Interface*
	rm -rf ${WRKBUILD}/CPAN/JSON/XS.pm

logitechmediaserver-install:
	$(INSTALL_DIR) $(IDIR_LOGITECHMEDIASERVER)/opt/lms
	$(CP) $(WRKSRC)/* $(IDIR_LOGITECHMEDIASERVER)/opt/lms
	@find $(IDIR_LOGITECHMEDIASERVER)/opt/lms -type f -exec chmod 644 {} \;
	@find $(IDIR_LOGITECHMEDIASERVER)/opt/lms -type d -exec chmod 755 {} \;
	$(INSTALL_DIR) $(IDIR_LOGITECHMEDIASERVER)/opt/lms/prefs/plugin
	$(INSTALL_DIR) $(IDIR_LOGITECHMEDIASERVER)/opt/lms/Logs
	$(INSTALL_DIR) $(IDIR_LOGITECHMEDIASERVER)/opt/lms/Cache

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
