#!../../bin/windows-x64/axisTest

## You may have to change axisTest to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/axisTest.dbd"
axisTest_registerRecordDeviceDriver pdbbase

##ISIS## Run IOC initialisation 
< $(IOCSTARTUP)/init.cmd

# Create simulated motors: ( start card , start axis , low limit, high limit, home posn, # cards, # axes to setup)
motorSimCreate( 0, 0, -32000, 32000, 0, 1, 16 )

# Setup the Asyn layer (portname, low-level driver drvet name, card, number of axes on card)
drvAsynMotorConfigure("motorSim1", "motorSim", 0, 16)

## Load record instances

##ISIS## Load common DB records 
< $(IOCSTARTUP)/dbload.cmd

## Load our record instances
dbLoadRecords("db/axisTest.db","P=$(MYPVPREFIX),M=MOT:MTR0101,ADDR=0")
dbLoadRecords("${MOTOR}/motorApp/Db/stop_all.db","P=$(MYPVPREFIX),M=MOT:MTR0101,AS=$(MYPVPREFIX)CS")
dbLoadRecords("db/axis.db","P=$(MYPVPREFIX),AXIS=MOT:axis1,mAXIS=MOT:MTR0101")

##ISIS## Stuff that needs to be done after all records are loaded but before iocInit is called 
< $(IOCSTARTUP)/preiocinit.cmd

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=faa59Host"

##ISIS## Stuff that needs to be done after iocInit is called e.g. sequence programs 
< $(IOCSTARTUP)/postiocinit.cmd

