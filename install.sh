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
./${ADBBINARY} push assets/xposed-sdk21-x86/system /data/local/tmp/system
./${ADBBINARY} push files/installer /data/local/tmp
./${ADBBINARY} shell "su -c chmod 755 /data/local/tmp/installer"

echo 
echo 
echo Installing Xposed Framework ..
echo 
echo 
./${ADBBINARY} shell "su -c /data/local/tmp/installer"

echo 
echo 
echo Done, rebooting ..
echo 
echo 
./${ADBBINARY} reboot

