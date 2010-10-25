#!/system/bin/sh

#Removal Beta v1.1 by Decad3nce
#Application:
application="Battery Tweak Script";
#End

RemoveAllFiles()
{
   mount -t rfs -o remount,rw /dev/block/stl9 /system
   rm /system/bin/batt.sh;
   rm /system/bin/batt-cfg;
   rm /system/etc/batt.conf;
   rm /system/etc/batt-temp.conf;
   rm /system/bin/batt-diag;
   egrep -v 'collin_ph|oneshot' /system/etc/init.local.rc > /system/etc/init.local.rc.tmp
   mv /system/etc/init.local.rc.tmp /system/etc/init.local.rc
   chmod 755 /system/etc/init.local.rc
   log "collin_ph: Removed $application";
   rm /system/bin/batt-rm.sh;
   mount -t rfs -o remount,ro /dev/block/stl9 /system
   exit;
}

DontRemoveFiles()
{
   mount -t rfs -o remount,rw /dev/block/stl9 /system 
   log "collin_ph: Canceled Removal of $application";
   mount -t rfs -o remount,ro /dev/block/stl9 /system
   exit;
}

echo ""
echo ""
echo ""

echo "This tool will remove almost all traces of the Battery Tweak"
echo ""
echo "Are you sure that you want to go through with this?[y/n]"
read ANS

case $ANS in
           "y") RemoveAllFiles;;
           "n") DontRemoveFiles;;
             *) echo "collin_ph: Cancelled Removal of $application";;
esac

done
