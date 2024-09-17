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
    omsMXA(const char* , int , const char*, const char*, int , int );
    static void asynCallback(void*, asynUser*, char *, size_t, int);
    int portConnected;
    int notificationCounter;
    epicsMutex* notificationMutex;
    epicsEventWaitStatus waitInterruptible(double);
    asynStatus sendReceive(const char *, char *, unsigned int );
    asynStatus sendOnly(const char *);
    virtual bool resetConnection();

private:
    int isNotification (char *);
    asynUser* pasynUserSerial;
    asynUser* pasynUserSyncIOSerial;
    asynOctet *pasynOctetSerial;
    void* octetPvtSerial;
    char* serialPortName;
    double timeout;
};

#endif /* OMSMXA_H_ */
