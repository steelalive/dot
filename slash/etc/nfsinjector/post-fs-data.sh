#!/system/bin/sh
SYS=/system
VEN=/system/vendor
NVBASE=/data/adb
MOUNTEDROOT=/data/dot/slash/etc/nfsinjector
MODID=nfsinjector
SYSOVER=false
LIBDIR=/system
MAGISK=false
ROOT=
INFO=$MOUNTEDROOT/nfsinjector/nfsinjector-files
FFC=/sys/kernel/fast_charge/force_fast_charge
ACL=/sys/kernel/fast_charge/ac_charge_level
FL=/sys/kernel/fast_charge/failsafe
UCL=/sys/kernel/fast_charge/usb_charge_level
WCL=/sys/kernel/fast_charge/wireless_charge_level
SCL=/sys/kernel/fast_charge/screen_on_current_limit
chmod 0644 $FFC
chmod 0644 $FL
chmod 0644 $SCL
if [ -e /sys/kernel/fast_charge/ac_charge_level ]; then	
 if [ -e /sys/class/power_supply/battery/batt_slate_mode ]; then	
  echo "1" > /sys/class/power_supply/battery/batt_slate_mode
 fi;
fi;
if [ -e $ACL ]; then
 echo "2" > $FFC
 echo "2100" > $ACL
 echo "1200" > $UCL
 echo "1200" > $WCL
 echo "0" > $FL
elif [ -e $FFC ]; then
 echo "1" > $FFC
fi;
if [ -e $SCL ]; then
 echo "0" > $SCL
fi;
chmod 0444 $FFC
chmod 0444 $FL
chmod 0444 $SCL

