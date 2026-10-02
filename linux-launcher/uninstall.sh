#!/bin/sh
# Removes what install.sh created, nothing else.

set -eu

INSTALL_DIR="$HOME/.local/share/apri-p7m"
BIN_FILE="$HOME/.local/bin/apri-p7m"
DESKTOP_FILE="$HOME/.local/share/applications/apri-p7m.desktop"

rm -rf "$INSTALL_DIR"
rm -f "$BIN_FILE"
rm -f "$DESKTOP_FILE"

if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
fi

echo "Rimosso: $INSTALL_DIR"
echo "Rimosso: $BIN_FILE"
echo "Rimosso: $DESKTOP_FILE"
