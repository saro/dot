#!/bin/bash

# set -e
set -x

tempdir=$(mktemp -d)
mkdir "$tempdir/extract"
cd "$tempdir/extract"
set +e
unzip /usr/lib/firefox/browser/omni.ja

# echo ${tempdir}
# exit 0
# if [ "$?" -ne 0 ]; then
#   echo >&2 "Unexpected exit code from unzip"
#   exit 1
# fi
# set -e
# patch -p0 <<EOF
# --- chrome/browser/content/browser/browser.xhtml	2024-02-03 15:12:34.930804549 +0100
# +++ chrome/browser/content/browser/browser.xhtml	2024-02-03 15:14:07.708993183 +0100
# @@ -294,8 +294,6 @@
#           modifiers="accel" reserved="true"/>
#      <key id="key_newNavigatorTab" data-l10n-id="tab-new-shortcut" modifiers="accel"
#           command="cmd_newNavigatorTabNoEvent" reserved="true"/>
# -    <key id="focusURLBar" data-l10n-id="location-open-shortcut" command="Browser:OpenLocation"
# -         modifiers="accel"/>
#      <key id="focusURLBar2" data-l10n-id="location-open-shortcut-alt" command="Browser:OpenLocation"
#           modifiers="alt"/>
#
# @@ -388,11 +386,6 @@
#      <key id="key_stop" keycode="VK_ESCAPE" command="Browser:Stop"/>
#
#
# -    <key id="key_gotoHistory"
# -         data-l10n-id="history-sidebar-shortcut"
# -         modifiers="accel"
# -        />
# -
#      <key id="key_fullZoomReduce" data-l10n-id="full-zoom-reduce-shortcut" command="cmd_fullZoomReduce"  modifiers="accel"/>
#      <key                         data-l10n-id="full-zoom-reduce-shortcut-alt-a" command="cmd_fullZoomReduce"  modifiers="accel"/>
#      <key                         data-l10n-id="full-zoom-reduce-shortcut-alt-b" command="cmd_fullZoomReduce"  modifiers="accel"/>
# EOF
vim chrome/browser/content/browser/browser.xhtml
zip -qr9XD ../omni.ja *
sudo bash -c "cp /usr/lib/firefox/browser/omni.ja /usr/lib/firefox/browser/omni.ja.orig ; cat $tempdir/omni.ja >/usr/lib/firefox/browser/omni.ja"
find ~/.cache/mozilla/firefox -type d -name startupCache | xargs rm -rf
cd /
rm -r "$tempdir"
