PYTHON_VERSION=2.7
ifeq ($(ADK_NATIVE),)
PYTHON_LIBDIR:=$(STAGING_HOST_DIR)/usr/lib
PYTHON:=${STAGING_HOST_DIR}/usr/bin/python
else
PYTHON_LIBDIR:=/usr/lib
PYTHON:=/usr/bin/python
endif
