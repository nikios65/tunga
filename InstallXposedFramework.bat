@echo off

set adb=files\adb.exe

echo '
echo '
echo ' Connecting ZenFone ..
echo '
echo '
%adb% wait-for-devices

echo '
echo '
echo ' Pushing files ..
echo '
echo '
%adb% push assets\xposed-sdk21-x86\system /data/local/tmp/system
%adb% push files\installer /data/local/tmp
%adb% shell "su -c chmod 755 /data/local/tmp/installer"

echo '
echo '
echo ' Installing Xposed Framework ..
echo '
echo '
%adb% shell "su -c /data/local/tmp/installer"

echo '
echo '
echo ' Done, rebooting ..
echo '
echo '
%adb% reboot
