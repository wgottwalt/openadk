# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
# 
# optimization configure options for CPU features

ifeq ($(DEVICE),alix1c)
CONFIGURE_CPU_OPTS:=	--disable-ssse3 \
			--disable-sse \
			--enable-amd3dnow \
			--enable-amd3dnowext \
			--enable-mmx \
			--enable-mmx2
else
CONFIGURE_CPU_OPTS:=	--disable-ssse3 \
			--disable-sse \
			--disable-mmxext \
			--disable-amd3dnow \
			--disable-amd3dnowext \
			--disable-mmx \
			--disable-mmx2
endif
