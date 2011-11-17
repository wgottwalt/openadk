# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		jamvm
PKG_VERSION:=		1.5.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		7654e9657691f5f09c4f481ed4686176
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=jamvm/}

include ../rules.mk

install: ${STAGING_JAVA_HOST_DIR}/usr/bin/jamvm

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	cd $(WRKBUILD); env \
               CC='${CC_FOR_BUILD}' \
               CXX='${CXX_FOR_BUILD}' \
           ./configure \
               --prefix=$(STAGING_JAVA_HOST_DIR)/usr \
               --with-classpath-install-dir=$(STAGING_JAVA_HOST_DIR)/usr
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	${MAKE} -C ${WRKBUILD} $(MAKE_TRACE)
	touch $@

${STAGING_JAVA_HOST_DIR}/usr/bin/jamvm: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} install $(MAKE_TRACE)
	ln -sf ${STAGING_JAVA_HOST_DIR}/usr/bin/jamvm ${STAGING_JAVA_HOST_DIR}/usr/lib/jvm/bin/java
	ln -sf ${STAGING_JAVA_HOST_DIR}/usr/bin/jamvm ${STAGING_JAVA_HOST_DIR}/usr/lib/jvm/jre/bin/java

include $(TOPDIR)/mk/tools.mk
