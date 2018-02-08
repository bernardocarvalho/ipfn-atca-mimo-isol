################################################################################
# $HeadURL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/driver/Makefile $
# $Id: Makefile 7300 2015-04-09 16:55:21Z bernardo $
#
# ATCA IOC W7-X Integrator/Processor  Linux driver 
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2, as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Tested with Linux: 3.10.0-229.rt56.147.el6rt.x86_64
# Contact Information:
#
# Instituto de Plasmas e Fusao Nuclear, Instituto Superior Tecnico, 
# Universidade  de Lisboa, 1049-001 Lisboa, Portugal.
#
################################################################################

###########################################################################
# Driver files

# core driver files

DRIVER_NAME := atca_ioc_w7x_intrlck

TARGET := $(DRIVER_NAME).ko
CFILES :=  atca-ioc-int-drv.c ioctl.c

KVER = $(shell uname -r)
KDIR = /lib/modules/$(KVER)/build
PWD = $(shell pwd)
#DEST = /lib/modules/$(KVER)/kernel/$(MDIR)


$(DRIVER_NAME)-objs := $(CFILES:.c=.o)
obj-m := $(DRIVER_NAME).o

# set the install path
INSTDIR := /lib/modules/$(KVER)/kernel/drivers/atca

# Comment/uncomment the following line to disable/enable debugging
#DEBUG = y

# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG),y)
  DEBFLAGS = -O -g -DATCA_DEBUG # "-O" is needed to expand inlines
else
  DEBFLAGS = -O2
endif

EXTRA_CFLAGS += -I$(LDDINC)
EXTRA_CFLAGS += $(DEBFLAGS)

KERNEL_VERSION := $(shell uname -r)
PACKAGE_NAME := atca-ioc-w7x-intrlck-driver-${KERNEL_VERSION}
PACKAGE_VERSION=0.0.0

DEBPKG_NAME := $(PACKAGE_NAME)-$(PACKAGE_VERSION)
DEBPKG_MODULE_DIR := $(DEBPKG_NAME)/lib/modules/$(KVER)/kernel/drivers/atca
DEBPKG_UDEV_RULES_DIR := $(DEBPKG_NAME)/etc/udev/rules.d
DEBPKG_DEBIAN_DIR := $(DEBPKG_NAME)/DEBIAN
DEBPKG_FILES := $(DEBPKG_MODULE_DIR)/$(TARGET) $(DEBPKG_UDEV_RULES_DIR)/atca_ioc.rules $(DEBPKG_DEBIAN_DIR)/control $(DEBPKG_DEBIAN_DIR)/postinst $(DEBPKG_DEBIAN_DIR)/prerm $(DEBPKG_DEBIAN_DIR)/postrm
DEBPKG_TARGET := $(DEBPKG_NAME).deb


#all:
default:
	$(MAKE) -C $(KDIR) M=$(PWD) LDDINC=$(PWD)/../include modules
clean:
	rm -f *.o *.ko .*.cmd .*.flags *.mod.c
	rm -rf $(PACKAGE_NAME)*

install: default # 
#         # remove all old versions of the driver
	find /lib/modules/$(KVER) -name $(TARGET) -exec rm -f {} \; || true
	install -D -m 644 $(TARGET) $(INSTDIR)/$(TARGET)
	/sbin/depmod -a || true
	install -m 0644   atca_ioc.rules /etc/udev/rules.d

uninstall: clean
	find /lib/modules/$(KVER) -name $(TARGET) -exec rm -f {} \; || true
	/sbin/depmod -a || true
	find /etc/udev/rules.d -name atca_ioc -exec rm -f {} \; || true

#
# Rules to create Debian package
#

package: $(DEBPKG_TARGET)

$(DEBPKG_TARGET): $(DEBPKG_FILES)
	@fakeroot dpkg --build $(DEBPKG_NAME)

$(DEBPKG_MODULE_DIR)/$(TARGET): $(TARGET) $(DEBPKG_MODULE_DIR)
	@install -D -m 644 $(TARGET) $(DEBPKG_MODULE_DIR)/$(TARGET)	

$(DEBPKG_UDEV_RULES_DIR)/atca_ioc.rules: atca_ioc.rules $(DEBPKG_UDEV_RULES_DIR)
	@install -m 0644 atca_ioc.rules $(DEBPKG_UDEV_RULES_DIR)

$(DEBPKG_DEBIAN_DIR)/control: $(DEBPKG_DEBIAN_DIR)
	@echo "Package: ${PACKAGE_NAME}\nVersion: ${PACKAGE_VERSION}\nSection: kernel\nPriority: optional\nArchitecture: amd64\nMaintainer: Max-Planck-Institut für Plasmaphyisk, CoDaC\nHomepage: http://www.ipp.mpg.de\nDescription: Kernel module for ATCA MIMO32 devices with interlock functionality (provided by IST)\nDepends: linux-image-$(KERNEL_VERSION)\n" > "${DEBPKG_DEBIAN_DIR}/control"

$(DEBPKG_DEBIAN_DIR)/postinst: $(DEBPKG_DEBIAN_DIR)
	@echo "#!/bin/sh\n\n/sbin/depmod $(KERNEL_VERSION) || true\n" > "${DEBPKG_DEBIAN_DIR}/postinst"
	@chmod 0755 "${DEBPKG_DEBIAN_DIR}/postinst"

$(DEBPKG_DEBIAN_DIR)/prerm: $(DEBPKG_DEBIAN_DIR)
	@echo "#!/bin/sh\n\nif lsmod | grep atca_ioc_w7x_intrlck > /dev/null 2>&1 ; then\n  /sbin/rmmod atca_ioc_w7x_intrlck || true\nfi\n" > "${DEBPKG_DEBIAN_DIR}/prerm"
	@chmod 0755 "${DEBPKG_DEBIAN_DIR}/prerm"

$(DEBPKG_DEBIAN_DIR)/postrm: $(DEBPKG_DEBIAN_DIR)
	@echo "#!/bin/sh\n\n/sbin/depmod $(KERNEL_VERSION) || true\n" > "${DEBPKG_DEBIAN_DIR}/postrm"
	@chmod 0755 "${DEBPKG_DEBIAN_DIR}/postrm"

$(DEBPKG_MODULE_DIR):
	@mkdir -p $(DEBPKG_MODULE_DIR)

$(DEBPKG_UDEV_RULES_DIR):
	@mkdir -p $(DEBPKG_UDEV_RULES_DIR)

$(DEBPKG_DEBIAN_DIR):
	@mkdir -p $(DEBPKG_DEBIAN_DIR)
