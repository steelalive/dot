#!/system/bin/sh
SYS=/system
VEN=/system/vendor
NVBASE=/data/adb
MOUNTEDROOT=/data/adb/modules/nfsinjector
MODID=nfsinjector
SYSOVER=false
LIBDIR=/system
MAGISK=true
ROOT=
INFO=/data/adb/modules/nfsinjector/nfsinjector-files
$SYSOVER && { mount -o rw,remount /system; [ -L /system/vendor ] && mount -o rw,remount /vendor; }

FILE=$INFO
[ -f /data/adb/modules/nfsinjector/$MODID-files ] && FILE=/data/adb/modules/nfsinjector/$MODID-files
if [ -f $FILE ]; then
  while read LINE; do
    if [ "$(echo -n $LINE | tail -c 1)" == "~" ] || [ "$(echo -n $LINE | tail -c 9)" == "NORESTORE" ]; then
      continue
    elif [ -f "$LINE~" ]; then
      mv -f $LINE~ $LINE
    else
      rm -f $LINE
      while true; do
        LINE=$(dirname $LINE)
        [ "$(ls -A $LINE 2>/dev/null)" ] && break 1 || rm -rf $LINE
      done
    fi
  done < $FILE
fi

$SYSOVER && { rm -f $INFO; mount -o ro,remount /system; [ -L /system/vendor ] && mount -o ro,remount /vendor; }

