adb shell mount -o remount,rw /system
adb push services.jar /system/framework/
adb shell chmod 644 /system/framework/services.jar
adb shell sync
#adb shell reboot
