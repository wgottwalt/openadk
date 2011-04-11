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
	$(STAGING_JAVA_HOST_DIR)/usr/bin/gcj -g -O2 -findirect-dispatch \
		-o ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj.native \
		--main=org.eclipse.jdt.internal.compiler.batch.Main \
		$(TOPDIR)/jtools_build/gcc-4.5.2/ecj.jar
	$(CP) $(TOPDIR)/jtools_build/gcc-4.5.2/ecj.jar ${STAGING_JAVA_HOST_DIR}/usr/share/ecj.jar
	echo "env LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj.native \$$@" > \
		${STAGING_JAVA_HOST_DIR}/usr/bin/ecj
	chmod u+x ${STAGING_JAVA_HOST_DIR}/usr/bin/ecj
	# put a wrapper for java here
	echo "env LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 ${STAGING_JAVA_HOST_DIR}/usr/bin/gij \"\$$@\"" > \
		${STAGING_JAVA_HOST_DIR}/usr/bin/java
	chmod u+x ${STAGING_JAVA_HOST_DIR}/usr/bin/java
	rm ${STAGING_JAVA_HOST_DIR}/usr/lib/jvm/bin/java
	rm ${STAGING_JAVA_HOST_DIR}/usr/lib/jvm/jre/bin/java
	cp ${STAGING_JAVA_HOST_DIR}/usr/bin/java ${STAGING_JAVA_HOST_DIR}/usr/lib/jvm/bin/java
	cp ${STAGING_JAVA_HOST_DIR}/usr/bin/java ${STAGING_JAVA_HOST_DIR}/usr/lib/jvm/jre/bin/java

include $(TOPDIR)/mk/tools.mk
