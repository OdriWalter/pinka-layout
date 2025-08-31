#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
symbols_src="$SCRIPT_DIR/linux/symbols/pinka"
rules_snippet="$SCRIPT_DIR/linux/rules/evdev.xml"
symbols_dst="/usr/share/X11/xkb/symbols/pinka"
rules_dst="/usr/share/X11/xkb/rules/evdev.xml"

install -D -m 0644 "$symbols_src" "$symbols_dst"

if ! grep -q '<name>pinka</name>' "$rules_dst"; then
  perl -0 -i -pe "s|</layoutList>|$(printf '%s\n' "$(cat "$rules_snippet")")\n</layoutList>|m" "$rules_dst"
fi

echo "Pinka layout installed. Log out and back in or restart to apply."

