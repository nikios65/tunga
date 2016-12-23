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
echo ' Installing Xposed Installer ..
echo '
echo '
%adb% install assets\XposedInstaller_3.0-alpha2.apk

echo '
echo '
echo ' Done
echo '
echo '
pause
