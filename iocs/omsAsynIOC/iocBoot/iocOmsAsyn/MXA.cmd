# Ethernet
drvAsynIPPortConfigure("MXA","192.168.1.100:23",0,0,0)
# Serial
#!drvAsynSerialPortConfigure("MXA","/dev/ttyS0",0,0,0)
#!asynSetOption("MXA",0,"baud","115200")
#!asynSetOption("MXA",0,"bits","8")
#!asynSetOption("MXA",0,"parity","none")
#!asynSetOption("MXA",0,"crtscts","Y")

# The IEOS depends on the firmware version
#!asynOctetSetInputEos("MXA",0,"\n\r")
asynOctetSetInputEos("MXA",0,"\n")
asynOctetSetOutputEos("MXA",0,"\n")

dbLoadTemplate("MXA.substitutions", "P=$(PREFIX)")
#!dbLoadRecords("$(ASYN)/db/asynRecord.db","P=$(PREFIX),R=asyn_1,PORT=MXA,ADDR=0,OMAX=256,IMAX=256")

# omsMXAConfig(
#    const char *portName,      /* MXA Motor Asyn Port name */
#    int numAxes,               /* Number of axes this controller supports */
#    const char *serialPortName,/* MXA Serial Asyn Port name */
#    int movingPollPeriod,      /* Time to poll (msec) when an axis is in motion */
#    int idlePollPeriod,        /* Time to poll (msec) when an axis is idle. 0 for no polling */
#    const char *initString)    /* Init String sent to card */
# Example init strings:
#    Open-loop axes
#      "AX LH PSO; AY LH PSO; AZ LH PSO; AT LH PSO; AU LH PSO; AV LH PSO; AR LH PSO; AS LH PSO;"
#    Axis with incremental encoder
#      "AX LL PSE HTH HI1 EH1111;"
#    Axis with BiSS-C encoder
#      "AX LL PSE ECB32,500000;"
# Normal limit polarity for real NC limits
omsMXAConfig("MXA1", 8, "MXA", 200, 2000, "AX LH PSO; AY LH PSO; AZ LH PSO; AT LH PSO; AU LH PSO; AV LH PSO; AR LH PSO; AS LH PSO;")
