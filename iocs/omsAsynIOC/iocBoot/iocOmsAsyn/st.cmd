## Example vxWorks startup file

## The following is needed if your board support package doesn't at boot time
## automatically cd to the directory containing its startup script
#cd "/home/oxygen40/KPETERSN/epics/motor-split/OmsAsyn/motorOmsAsynBlank/iocs/omsAsynIOC/iocBoot/iocOmsAsyn"

< cdCommands
#< ../nfsCommands

cd topbin

## You may have to change omsAsyn to something else
## everywhere it appears in this file
ld 0,0, "omsAsyn.munch"

## Register all support components
cd top
dbLoadDatabase "dbd/omsAsyn.dbd"
omsAsyn_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadTemplate "db/omsAsyn.substitutions"
#dbLoadRecords "db/omsAsyn.db", "user=kpetersn"

cd startup
iocInit

## Start any sequence programs
#seq &sncxxx, "user=kpetersn"
