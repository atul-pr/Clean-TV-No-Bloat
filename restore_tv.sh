#!/bin/sh
# ==============================================================================
# CleanYourTV Restore Script (POSIX) - Vise / Skyworth SWTV-24AE-FHD
# This script re-enables all debloated packages, resets animation scales to 1.0,
# and restores the stock Google TV launcher.
# ==============================================================================

ADB="${ADB:-adb}"

echo "Re-enabling debloated packages..."

# Standard Android / Google telemetry and ad services
"$ADB" shell pm enable --user 0 com.android.adservices.api
"$ADB" shell pm enable --user 0 com.android.ondevicepersonalization.services
"$ADB" shell pm enable --user 0 com.android.federatedcompute.services
"$ADB" shell pm enable --user 0 com.google.android.feedback
"$ADB" shell pm enable --user 0 com.android.tv.feedbackconsent

# Setup wizard and Live TV app
"$ADB" shell pm enable --user 0 com.google.android.tungsten.setupwraith
"$ADB" shell pm enable --user 0 com.cltv.hybrid

# OEM / Skyworth smartdevice packages
"$ADB" shell pm enable --user 0 com.smartdevice.recordactivation
"$ADB" shell pm enable --user 0 com.smartdevice.aftersale
"$ADB" shell pm enable --user 0 com.smartdevice.recommendation
"$ADB" shell pm enable --user 0 com.Smartdevice.emanual
"$ADB" shell pm enable --user 0 com.smartdevice.dailymanage
"$ADB" shell pm enable --user 0 com.smartdevice.myapp
"$ADB" shell pm enable --user 0 com.smartdevice.dailyshortcut

# Re-enable stock Google TV launcher
"$ADB" shell pm enable --user 0 com.google.android.apps.tv.launcherx
"$ADB" shell cmd package set-home-activity com.google.android.apps.tv.launcherx/.home.HomeActivity

# Reset animation scales to 1.0
echo "Resetting animation scales to 1.0..."
"$ADB" shell settings put global window_animation_scale 1.0
"$ADB" shell settings put global transition_animation_scale 1.0
"$ADB" shell settings put global animator_duration_scale 1.0

echo "Restore complete."
