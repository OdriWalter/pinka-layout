#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

symbols_dst="/usr/share/X11/xkb/symbols/pinka"
rules_dst="/usr/share/X11/xkb/rules/evdev.xml"

rm -f "$symbols_dst"

if grep -q '<name>pinka</name>' "$rules_dst"; then
  perl -0 -i -pe 's|\n?\s*<layout>\n\s*<configItem>\n\s*<name>pinka</name>.*?\n\s*</layout>||ms' "$rules_dst"
fi

echo "Pinka layout removed."

