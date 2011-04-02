# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gcj
PKG_VERSION:=		4.5.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		d6559145853fbaaa0fd7556ed93bce9a
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
DISTFILES:=		gcc-$(PKG_VERSION).tar.bz2

WRKDIST=		${WRKDIR}/gcc-${PKG_VERSION}

include ../rules.mk

GCJ_ENV+=		ac_cv_prog_JAR=$(STAGING_JAVA_HOST_DIR)/usr/bin/fastjar
GCJ_ENV+=		JAR=$(STAGING_JAVA_HOST_DIR)/usr/bin/fastjar

install: ${STAGING_JAVA_HOST_DIR}/usr/bin/gcj

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd $(WRKBUILD); \
		wget -O ecj.jar ftp://sourceware.org/pub/java/ecj-latest.jar; \
		env ${GCJ_ENV} ./configure \
			--prefix=/usr \
			--enable-java-home \
			--enable-languages=java \
			--with-ffi \
			--with-mpc=$(STAGING_HOST_DIR) \
			--with-mpfr=$(STAGING_HOST_DIR) \
			--with-gmp=$(STAGING_HOST_DIR) \
			--with-jar=$(STAGING_JAVA_HOST_DIR)/usr/bin/fastjar \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-biarch \
			--disable-decimal-float \
			--disable-multilib \
			--disable-bootstrap \
	);
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	env ${GCJ_ENV} ${MAKE} -C ${WRKBUILD} $(MAKE_TRACE)
	touch $@

${STAGING_JAVA_HOST_DIR}/usr/bin/gcj: $(WRKBUILD)/.compiled
	$(INSTALL_DIR) ${STAGING_JAVA_HOST_DIR}
	env ${GCJ_ENV} ${MAKE} -C ${WRKBUILD} \
	    DESTDIR=$(STAGING_JAVA_HOST_DIR) install $(MAKE_TRACE)

include $(TOPDIR)/mk/tools.mk
