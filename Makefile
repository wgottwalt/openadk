# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# GNU make and BSD make compatible make file wrapper
MAKECMDGOALS+= ${.TARGETS}

all v help targethelp kernelconfig image menuconfig download clean cleankernel cleansystem cleandir distclean hostclean hostpackage fetch package extract patch dep menu:
	@./scripts/prereq.sh ${MAKECMDGOALS}
