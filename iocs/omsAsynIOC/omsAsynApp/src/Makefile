TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = omsAsyn
# omsAsyn.dbd will be created and installed
DBD += omsAsyn.dbd

# omsAsyn.dbd will be made up from these files:
omsAsyn_DBD += base.dbd

# Include dbd files from all support applications:
#omsAsyn_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#omsAsyn_LIBS += xxx

# omsAsyn_registerRecordDeviceDriver.cpp derives from omsAsyn.dbd
omsAsyn_SRCS += omsAsyn_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
omsAsyn_SRCS_DEFAULT += omsAsynMain.cpp
omsAsyn_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#omsAsyn_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
omsAsyn_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

