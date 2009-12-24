CC?=		gcc
GMAKE?=		env ${GMAKE_ENV} $(PWD)/scripts/make
GMAKE_FMK=	${GMAKE} -f $(PWD)/mk/build.mk
GMAKE_INV=	${GMAKE_FMK} --no-print-directory
