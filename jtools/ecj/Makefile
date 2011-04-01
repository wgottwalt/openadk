# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ecj
PKG_VERSION:=		1
PKG_RELEASE:=		1
PKG_MD5SUM:=		63220327925ace13756ae334c55a3baa

include ../rules.mk

install: ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj

${STAGING_JAVA_HOST_DIR}/usr/bin/ecj:
	$(STAGING_JAVA_HOST_DIR)/usr/bin/gcj -g -static -O2 -m64 -Wl,-Bsymbolic -findirect-dispatch \
		-o ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj --main=org.eclipse.jdt.internal.compiler.batch.Main \
		$(TOPDIR)/jtools_build/gcc-4.5.2/ecj.jar
	$(CP) $(TOPDIR)/jtools_build/gcc-4.5.2/ecj.jar ${STAGING_JAVA_HOST_DIR}/usr/share/ecj.jar

include $(TOPDIR)/mk/tools.mk
