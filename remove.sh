#!/bin/sh

BASEDIR=$(dirname $0)
cd $BASEDIR

chmod +x files/adb.mac

ADBBINARY="files/adb.mac"

echo
echo
echo Connecting ZenFone ..
echo
echo
./${ADBBINARY} wait-for-device

echo 
echo 
echo Pushing files ..
echo 
echo 
./${ADBBINARY} push files/uninstaller /data/local/tmp
./${ADBBINARY} shell "su -c chmod 755 /data/local/tmp/uninstaller"

echo 
echo 
echo Removing Xposed Framework ..
echo 
echo 
./${ADBBINARY} shell "su -c /data/local/tmp/uninstaller"

echo 
echo 
echo Done, rebooting ..
echo 
echo 
./${ADBBINARY} reboot
