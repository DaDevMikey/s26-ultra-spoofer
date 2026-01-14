#!/system/bin/sh
MODDIR=${0%/*}

ORIG_XML="/system/etc/floating_feature.xml"
MOD_XML="$MODDIR/system/etc/floating_feature.xml"

if [ -f "$ORIG_XML" ]; then
    mkdir -p "$MODDIR/system/etc"
    cp -f "$ORIG_XML" "$MOD_XML"
    sed -i 's|<SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>.*</SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>|<SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>20263</SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>|g' "$MOD_XML"
    chown 0:0 "$MOD_XML"
    chmod 644 "$MOD_XML"
fi