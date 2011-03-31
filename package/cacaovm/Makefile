# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cacaovm
PKG_VERSION:=		0.99.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		63220327925ace13756ae334c55a3baa
PKG_DESCR:=		Java VM
PKG_SECTION:=		lang
PKG_BUILDDEP:=		classpath zlib
PKG_DEPENDS:=		classpath zlib
PKG_URL:=		http://www.cacaovm.org/
PKG_SITES:=		http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-0.99.4/

WRKDIST=		${WRKDIR}/cacao-${PKG_VERSION}
DISTFILES:=             cacao-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CACAOVM,cacaovm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-jni_md_h=${STAGING_TARGET_DIR}/usr/include \
			--with-java-runtime-library-prefix=${STAGING_TARGET_DIR}/usr \
			--with-cacaoh=${STAGING_TARGET_DIR}/bin/cacaoh

post-patch:
	(cd ${WRKBUILD}; ./configure \
		--enable-jit \
		--with-java-runtime-library-prefix=/opt/local \
		--enable-gc=none \
	);
	$(MAKE) -C ${WRKBUILD}/src/vmcore
	$(MAKE) -C ${WRKBUILD}/src/toolbox
	$(MAKE) -C ${WRKBUILD}/src/cacaoh
	$(CP) $(WRKBUILD)/src/cacaoh/cacaoh $(STAGING_TARGET_DIR)/bin
	$(MAKE) -C ${WRKBUILD} clean

cacaovm-install:
	$(INSTALL_DIR) $(IDIR_CACAOVM)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjvm.so $(IDIR_CACAOVM)/usr/lib
	$(INSTALL_DIR) $(IDIR_CACAOVM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cacao $(IDIR_CACAOVM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/java $(IDIR_CACAOVM)/usr/bin
	$(INSTALL_DIR) $(IDIR_CACAOVM)/usr/share/cacao
	$(CP) $(WRKINST)/usr/share/cacao/vm.zip \
		$(IDIR_CACAOVM)/usr/share/cacao

include ${TOPDIR}/mk/pkg-bottom.mk
