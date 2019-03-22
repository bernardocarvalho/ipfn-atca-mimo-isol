#!/bin/bash
echo START ACQUISITION
./acqDataProc atca.cfg
su -c ./reinstall_driver.sh
echo ACQUISITION DONE

