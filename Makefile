# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# GNU make and BSD make compatible make file wrapper
all v menuconfig download clean cleankernel cleansystem cleandir distclean hostclean hostpackage package:
	@./scripts/prereq.sh $@
