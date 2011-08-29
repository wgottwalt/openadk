# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ecj
PKG_VERSION:=		1
PKG_RELEASE:=		2
PKG_MD5SUM:=		63220327925ace13756ae334c55a3baa

include ../rules.mk

install: ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj

${STAGING_JAVA_HOST_DIR}/usr/bin/ecj:
	env \
		DYLD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 \
		LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 \
		PATH=$(STAGING_JAVA_HOST_DIR)/usr/bin:$$PATH \
	$(STAGING_JAVA_HOST_DIR)/usr/bin/gcj -O2 -findirect-dispatch \
		-o ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj.native \
		--main=org.eclipse.jdt.internal.compiler.batch.Main \
		$(TOPDIR)/jtools_build/gcc-$(GCJ_VER)/ecj.jar
	echo "env LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj.native \$$@" > \
		${STAGING_JAVA_HOST_DIR}/usr/bin/ecj
	chmod u+x ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj
	# put a wrapper for java here
	mv ${STAGING_JAVA_HOST_DIR}/usr/bin/gij ${STAGING_JAVA_HOST_DIR}/usr/bin/gij.native
	echo "env LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 ${STAGING_JAVA_HOST_DIR}/usr/bin/gij.native \"\$$@\"" > \
		${STAGING_JAVA_HOST_DIR}/usr/bin/java
	chmod u+x ${STAGING_JAVA_HOST_DIR}/usr/bin/java
	echo "env LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 ${STAGING_JAVA_HOST_DIR}/usr/bin/gij.native \"\$$@\"" > \
		${STAGING_JAVA_HOST_DIR}/usr/bin/gij
	chmod u+x ${STAGING_JAVA_HOST_DIR}/usr/bin/gij

include $(TOPDIR)/mk/tools.mk
