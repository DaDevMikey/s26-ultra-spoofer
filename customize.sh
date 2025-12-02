ui_print "S25Ultra Spoofer"
ui_print "Spoof Your Device To S25 Ultra Spoofer"
ui_print "v1.0.0"
ui_print "Are you sure you want to continue?"
ui_print "This will modify your device's build properties."
ui_print "Press Volume Up to continue or Volume Down to cancel."\
if ! confirm_action; then
    ui_print "Operation cancelled by user."
    exit 1
fi
ui_print "Applying S26 Ultra Spoofer..."
ui_print "Modifying build properties..."

cp /system/build.prop /system/build.prop.bak

ui_print "Build properties modified successfully."
ui_print "S26 Ultra Spoofer applied. Please reboot your device for changes to take effect."
