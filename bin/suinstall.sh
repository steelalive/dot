#!/bin/bash
sys=/tmp/aml/output/system
su=/prog/supersu_sys
for i in $su $sys; do
	[[ -e $i ]] || exit
done
mkdir -pv ${sys}/bin/.ext/.su
mkdir -pv ${sys}/app/SuperSU
cp -av "${su}"/common/Superuser.apk "${sys}"/app/SuperSU/SuperSU.apk
chmod 0644 "${sys}"/app/SuperSU/SuperSU.apk
cp -av "${su}"/common/install-recovery.sh "${sys}"/etc/install-recovery.sh
chmod 0755 "${sys}"/etc/install-recovery.sh
cp -av "${su}"/arm64/su "${sys}"/bin/.ext/.su
chmod 0755 "${sys}"/bin/.ext/.su
cp -av "${su}"/arm64/su "${sys}"/bin/.ext/.su
chmod 0755 "${sys}"/bin/.ext/.su
cp -av "${su}"/arm64/su "${sys}"/xbin/daemonsu
chmod 0755 "${sys}"/xbin/daemonsu
cp -av "${su}"/arm64/su "${sys}"/xbin/sugote
chmod 0755 "${sys}"/xbin/sugote
cp -av "${su}"/arm64/supolicy "${sys}"/xbin/supolicy
chmod 0755 "${sys}"/xbin/supolicy
cp -av "${su}"/arm64/libsupol.so "${sys}"'/lib64/libsupol.so'
cp -av "${su}"/arm64/libsupol.so "${sys}"'/lib/libsupol.so'
chmod -v 0755 "${sys}"'/lib64/libsupol.so'
touch "${sys}"/etc/.installed_su_daemon
chmod -v 0644 "${sys}"/etc/.installed_su_daemon
cp -av "${sys}"/bin/sh "${sys}"/xbin/sugote-mksh
chmod 0755 "${sys}"/xbin/sugote-mksh
cp -av "${sys}"/bin/app_process32 "${sys}"/bin/app_process32_original
chmod -v 0755 "${sys}"/bin/app_process32_original
mv -v "${sys}"/bin/app_process "${sys}"/bin/app_process_original
chmod 0755 -v "${sys}"/bin/app_process_original
mv -v "${sys}"/bin/app_process32 "${sys}"/bin/app_process_init
chmod -v 0755 "${sys}"/bin/app_process_init
cd "${sys}" || exit
cd ..
ln -svf system/xbin/daemonsu system/bin/app_process
ln -svf system/xbin/daemonsu system/bin/app_process32
cp -av $su/system/etc/install-recovery.sh $sys/bin/install-recovery.sh
for i in ${sys}/priv-app/*/*.apk ${sys}/app/*/*.apk; do chmod -c 644 "$i"; done
