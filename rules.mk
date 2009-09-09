# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/prereq.mk
-include $(TOPDIR)/.config

ifeq ($(VERBOSE),1)
START_TRACE:=		:
END_TRACE:=		:
TRACE:=			:
CMD_TRACE:=		:
PKG_TRACE:=		:
MAKE_TRACE:=
EXTRA_MAKEFLAGS:=
SET_DASHX:=		set -x
else
START_TRACE:=		echo -n "---> "
END_TRACE:=		echo
TRACE:=			echo "---> "
CMD_TRACE:=		echo -n
PKG_TRACE:=		echo "------> "
EXTRA_MAKEFLAGS:=	-s
MAKE_TRACE:=		>/dev/null 2>&1 || { echo "Build failed. Please re-run make with v to see what's going on"; false; }
SET_DASHX:=		:
endif

# Strip off the annoying quoting
DEVICE:=		$(strip $(subst ",, $(ADK_DEVICE)))
ADK_TARGET_SUFFIX:=	$(strip $(subst ",, $(ADK_TARGET_SUFFIX)))

ifeq ($(strip ${ADK_HAVE_DOT_CONFIG}),y)
include $(TOPDIR)/target/$(DEVICE)/device.mk
endif

include $(TOPDIR)/mk/vars.mk

export BASH HOSTCC HOSTCFLAGS MAKE LANGUAGE LC_ALL OStype PATH

HOSTCPPFLAGS?=
HOSTLDFLAGS?=
TARGET_CFLAGS:=		$(strip -fwrapv -fno-ident ${TARGET_CFLAGS})
TARGET_CC:=		$(strip ${TARGET_CC})
TARGET_CXX:=		$(strip ${TARGET_CXX})

ifneq (${show},)
_show:
	@echo '$($(show))'
endif
