ui_print "S26Ultra Spoofer"
ui_print "Spoof Your Device To S26 Ultra Spoofer"
ui_print "v1.0.0"

# Note: make sure confirm_action exists in your setup, otherwise remove this check
ui_print "Press Volume Up to continue or Volume Down to cancel."
if ! confirm_action; then
    ui_print "Operation cancelled by user."
    exit 1
fi

ui_print "Applying S26 Ultra Spoofer..."
ui_print "Modifying build properties..."

# --- GALAXY AI SPOOFING START ---
ui_print "Locating floating_feature.xml..."

# Try to find the file in common locations
AI_FILE=""
if [ -f "/system/etc/floating_feature.xml" ]; then
    AI_FILE="/system/etc/floating_feature.xml"
elif [ -f "/system/product/etc/floating_feature.xml" ]; then
    AI_FILE="/system/product/etc/floating_feature.xml"
elif [ -f "/vendor/etc/floating_feature.xml" ]; then
    AI_FILE="/vendor/etc/floating_feature.xml"
fi

if [ ! -z "$AI_FILE" ]; then
    ui_print "Found at: $AI_FILE"
    
    # Create the directory structure in the module path
    # $MODPATH is where magisk builds the module before mounting
    DEST_DIR="$MODPATH$(dirname $AI_FILE)"
    mkdir -p "$DEST_DIR"
    
    # Copy the original file to our module
    cp "$AI_FILE" "$DEST_DIR/"
    
    # Patch the AI version
    # Looking for the tag and replacing the content with 20261
    ui_print "Patching AI Version to 20261..."
    sed -i 's|<SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>.*</SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>|<SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>20263</SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>|g' "$DEST_DIR/floating_feature.xml"
    
    ui_print "Galaxy AI spoofed successfully."
else
    ui_print "! Could not find floating_feature.xml. AI spoof skipped."
fi
# --- GALAXY AI SPOOFING END ---

ui_print "S26 Ultra Spoofer applied. Reboot to see the magic. (if you want to also use the new AI features you can install the apks from our telegram channel t.me/oneui85apks)"

exit 0
