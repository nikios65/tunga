@echo off

set adb=files\adb.exe
set sleep=files\sleep.exe

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
%adb% push files\uninstaller /data/local/tmp
%adb% shell "su -c chmod 755 /data/local/tmp/uninstaller"

echo '
echo '
echo ' Removing Xposed Framework ..
echo '
echo '
%adb% shell "su -c /data/local/tmp/uninstaller"

echo '
echo '
echo ' Done, rebooting ..
echo '
echo '
%adb% reboot
