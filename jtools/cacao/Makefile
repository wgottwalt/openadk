# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cacao
PKG_VERSION:=		0.99.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		63220327925ace13756ae334c55a3baa
PKG_SITES:=		http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-0.99.4/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include ../rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/cacao

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd $(WRKBUILD); ./configure --prefix=/usr --disable-libjvm --enable-debug \
		--with-vm-zip=$(STAGING_HOST_DIR)/usr/share/cacao/vm.zip \
		--with-java-runtime-library=gnuclasspath \
		--with-java-runtime-library-classes=$(STAGING_HOST_DIR)/usr/share/classpath/glibj.zip \
		--with-java-runtime-library-prefix=$(STAGING_HOST_DIR)/usr \
		--with-jni_md_h=$(STAGING_HOST_DIR)/usr/include \
	);
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	${MAKE} -C ${WRKBUILD} $(MAKE_TRACE)
	touch $@

${STAGING_HOST_DIR}/usr/bin/cacao: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} DESTDIR=$(STAGING_HOST_DIR) install $(MAKE_TRACE)

include $(TOPDIR)/mk/tools.mk
