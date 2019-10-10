 
state=locked
outdir=/sdcard/dumps

if [[ -e "/dev/block/platform/d0074000.emmc"  ]]; then
  target="/dev/block/platform/d0074000.emmc" 
elif [[ -e "/dev/block/platform/*" ]]; then
  target="/dev/block/platform/*"
fi
if [[ "$target" ]]; then
  target=`echo -n $target`
  mkdir $outdir
  echo $target > $outdir/targets.txt
  bootdev=/dev/block/bootdevice/by-name
  test -e $bootdev && echo $bootdev >> $outdir/targets.txt
  for part in $(ls $target); do
    case $part in
      system|APP|cache|CAC|userdata|UDA|boot|LNX|recovery|SOS) ;
      *) echo dd if=$target/$part of=$outdir/$part-$state.img;
    esac
  done
fi
