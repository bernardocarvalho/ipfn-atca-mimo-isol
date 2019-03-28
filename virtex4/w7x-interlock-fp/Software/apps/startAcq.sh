#!/bin/bash
echo MOVING OLD FILES
mv *.bin old/
echo START ACQUISITION
./acqDataProc atca.cfg
su -c ./reinstall_driver.sh
echo ACQUISITION DONE

