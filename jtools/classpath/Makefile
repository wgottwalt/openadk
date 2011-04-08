# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		classpath
PKG_VERSION:=		0.98
PKG_RELEASE:=		1
PKG_MD5SUM:=		90c6571b8b0309e372faa0f9f6255ea9
PKG_SITES:=		${MASTER_SITE_GNU:=classpath/}

include ../rules.mk

install: ${STAGING_JAVA_HOST_DIR}/usr/share/classpath/glibj.zip

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd $(WRKBUILD); ./configure --prefix=${STAGING_JAVA_HOST_DIR}/usr \
		--disable-local-sockets \
		--disable-alsa \
		--disable-gconf-peer \
		--disable-gtk-peer \
		--disable-qt-peer \
		--disable-dssi \
		--disable-plugin \
		--disable-examples \
		--disable-gjdoc \
		--with-jar=no \
		--disable-Werror)
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	${MAKE} -C ${WRKBUILD}
	touch $@

${STAGING_JAVA_HOST_DIR}/usr/share/classpath/glibj.zip: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} install

include $(TOPDIR)/mk/tools.mk
