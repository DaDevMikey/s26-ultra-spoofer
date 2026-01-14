#!/system/bin/sh

ui_print "- Installing UI 8.5 + S26 Ultra Spoof"
ui_print "- Patching AI Version to 20263"
ui_print "- Installing Personal Data Intelligence (For Now Nudge)"

if [ -d "$MODPATH/system/priv-app/PersonalDataIntelligence" ]; then
    if [ -f "$MODPATH/system/priv-app/PersonalDataIntelligence/base.apk" ]; then
        mv "$MODPATH/system/priv-app/PersonalDataIntelligence/base.apk" \
           "$MODPATH/system/priv-app/PersonalDataIntelligence/PersonalDataIntelligence.apk"
    fi
    set_perm_recursive $MODPATH/system/priv-app/PersonalDataIntelligence 0 0 0755 0644
else
    ui_print "! Error: PersonalDataIntelligence folder not found!"
fi

# Check carrier code before replacing optics
SALES_CODE=$(getprop ro.csc.sales_code)
if [ -z "$SALES_CODE" ]; then
    SALES_CODE=$(getprop ril.sales_code)
fi

ui_print "- Detected carrier code: $SALES_CODE"

if [ "$SALES_CODE" = "EUX" ] || [ "$SALES_CODE" = "EUY" ]; then
    ui_print "- Replacing optics folder for $SALES_CODE"
    if [ -d "$MODPATH/system/etc/optics" ]; then
        touch "$MODPATH/system/etc/optics/.replace"
        set_perm_recursive "$MODPATH/system/etc/optics" 0 0 0755 0644
    fi
else
    ui_print "! Skipping optics replacement (not EUX/EUY device)"
    ui_print "! Your carrier: $SALES_CODE"
    rm -rf "$MODPATH/system/etc/optics"
fi

if [ -f "$MODPATH/system/etc/permissions/com.samsung.android.oneui.version.xml" ]; then
    set_perm $MODPATH/system/etc/permissions/com.samsung.android.oneui.version.xml 0 0 0644
fi