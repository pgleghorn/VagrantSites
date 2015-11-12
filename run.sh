#!/bin/sh

V_HOSTNAME
V_IP_ADDRESS
V_IP_NETMASK
V_PORT
V_SITES_INSTALLDIR
V_TOMCAT_INSTALLDIR
V_UNIXUSER
V_UNIXGROUP
V_SITES_PATCHLEVEL

VAGRANT_LOG=info
VAGRANT_LOGFILE=vagrant.log

export V_HOSTNAME V_PORT V_SITES_INSTALLDIR V_TOMCAT_INSTALLDIR V_UNIXUSER V_UNIXGROUP
export VAGRANT_LOG VAGRANT_LOGFILE

vagrant up | tee -a $VAGRANT_LOGFILE

