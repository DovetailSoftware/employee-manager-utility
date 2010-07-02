# $Header: $
#
# Name: Makefile
# Description: application makefile
# 
# Author:
#   First Choice Software, Inc.
#   4412 Spicewood Springs Road
#   Suite 701
#   Austin, TX 78759
#
# (C) Copyright 1999 First Choice Software, Inc.
# All Rights Reserved
#

#
# Package information
#
PACKAGE = emu
VERSION = 1.3.2

#
# Copy from TOP/schema to TOP/schema
#
FILESET1 = em_schema.sch
SOURCE1 = $(SOURCE_DIR)/schema
BUILD1 = $(BUILD_DIR)/schema

#
# Copy from TOP/import to TOP/import
#
FILESET2 = em_config.dat \
           em_strings.dat
SOURCE2 = $(SOURCE_DIR)/import
BUILD2 = $(BUILD_DIR)/import

#
# Copy from TOP/forms to TOP/forms
#
FILESET3 = em1947.dat \
           em1956.dat \
           em2265.dat \
           em2265-70.dat \
           em2266.dat \
           em2267.dat \
           em2268.dat \
           em2269.dat \
           em2271.dat \
           em2272.dat \
           em2273.dat \
           em2274.dat \
           em703.dat \
           em707.dat \
           em703-80.dat \
           em707-80.dat
SOURCE3 = $(SOURCE_DIR)/forms
BUILD3 = $(BUILD_DIR)/forms

#
# Copy from TOP/cb to TOP/cb
#
FILESET4 = em.dir \
           em_global.cbs \
           em_global_fd.cbs \
           string.cbs \
           em1947.cbs \
           em1956.cbs \
           em2265.cbs \
           em2265-70.cbs \
           em2266.cbs \
           em2267.cbs \
           em2268.cbs \
           em2269.cbs \
           em2271.cbs \
           em2272.cbs \
           em2273.cbs \
           em2274.cbs \
           em703.cbs \
           em707.cbs
SOURCE4 = $(SOURCE_DIR)/cb
BUILD4 = $(BUILD_DIR)/cb

#
# Don't change the rest
#
PACKAGE_NAME = $(PACKAGE).$(VERSION)
SOURCE_DIR = ../source
BUILD_DIR = ../build
SHIP_DIR = ../ship
USER_GUIDE_DIR = //NECROMANCER/user_guides
PDF_NAME = $(PACKAGE)_user.pdf
NEW_PDF_NAME = $(PACKAGE)_user.$(VERSION).pdf

#
# Create install images for all platforms
#
install: 
	rm $(SHIP_DIR)/*
	make build install_win

#install_unix:
#	tar -cvf $(BUILD_DIR)/$(PACKAGE_NAME).tar $(INSTALL)

#
# Create windows install package
#
install_win .SETDIR=$(BUILD_DIR): $(SHIP_DIR)/$(PACKAGE_NAME).zip

#
# Create windows zip file
#
$(SHIP_DIR)/$(PACKAGE_NAME).zip :
	zip -r $@ *
	cp $(SOURCE_DIR)/docs/$(PDF_NAME) $(SHIP_DIR)/$(NEW_PDF_NAME)
	rm $(USER_GUIDE_DIR)/$(PACKAGE)_user*.pdf
	cp $(SOURCE_DIR)/docs/$(PDF_NAME) $(USER_GUIDE_DIR)/$(NEW_PDF_NAME)
	

#
# Create build tree from source tree
#
build :: $(FILESET1:^"$(BUILD1)/")
build :: $(FILESET2:^"$(BUILD2)/")
build :: $(FILESET3:^"$(BUILD3)/")
build :: $(FILESET4:^"$(BUILD4)/")

#
# Process filesets
#
$(FILESET1:^"$(BUILD1)/") : $$(@:f:^"$(SOURCE1)/") 
	cp $< $@

$(FILESET2:^"$(BUILD2)/") : $$(@:f:^"$(SOURCE2)/") 
	cp $< $@

$(FILESET3:^"$(BUILD3)/") : $$(@:f:^"$(SOURCE3)/") 
	cp $< $@

$(FILESET4:^"$(BUILD4)/") : $$(@:f:^"$(SOURCE4)/") 
	cp $< $@

clean:
