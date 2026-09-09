/*
FILENAME...     omsMXA.h
USAGE...        Pro-Dex OMS MXA asyn motor controller support

*/

/*
 *  Created on: 10/2010
 *      Author: eden
 */

#ifndef OMSMXA_H_
#define OMSMXA_H_

#include "omsBaseController.h"

class omsMXA : public omsBaseController {
public:
    omsMXA(const char* , int , const char*, const char*, int , int , int );
    static void asynCallback(void*, asynUser*, char *, size_t, int);
    int portConnected;
    int notificationCounter;
    epicsMutex* notificationMutex;
    epicsEventWaitStatus waitInterruptible(double);
    asynStatus sendReceive(const char *, char *, unsigned int );
    asynStatus sendOnly(const char *);
    virtual bool resetConnection();
    virtual bool watchdogOK();

private:
    int isNotification (char *);
    void commandDelay();
    asynUser* pasynUserSerial;
    asynUser* pasynUserSyncIOSerial;
    asynOctet *pasynOctetSerial;
    void* octetPvtSerial;
    char* serialPortName;
    double timeout;
    /* minimum interval between commands, in seconds; 0 disables pacing */
    double commandDelay_;
    epicsTimeStamp lastCommandTime_;
    bool haveLastCommandTime_;
};

#endif /* OMSMXA_H_ */
