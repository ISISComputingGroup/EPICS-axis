TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#==================================================
# build a support library

LIBRARY_IOC += axis

# xxxRecord.h will be created from xxxRecord.dbd
#DBDINC += xxxRecord
# install axis.dbd into <top>/dbd
DBD += axis.dbd

# specify all source files to be compiled and added to the library
#axis_SRCS += xxx

axis_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

