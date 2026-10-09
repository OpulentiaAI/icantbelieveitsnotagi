#!/bin/bash
set -euo pipefail
PACKAGE_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
APP_NAME="Opulent Knowledge System.app"
SOURCE="$PACKAGE_DIR/$APP_NAME"
DEST_DIR="$HOME/Applications"
DEST="$DEST_DIR/$APP_NAME"
fail() { printf '\n%s\n' "$*" >&2; exit 1; }
[[ "$(uname -s)" == Darwin ]] || fail "This package requires macOS."
[[ "$(sysctl -n hw.optional.arm64 2>/dev/null || true)" == 1 ]] || fail "This build requires an Apple Silicon Mac."
[[ "$(sw_vers -productVersion | cut -d. -f1)" -ge 12 ]] || fail "This build requires macOS 12 or later."
[[ -d "$SOURCE" ]] || fail "Extract the full ZIP before running this installer. Keep the app beside this file."
/usr/bin/codesign --verify --deep --strict "$SOURCE" || fail "The app signature check failed. Download a fresh copy."
if [[ "${1:-}" == --check ]]; then
  printf 'Package verified. Installation destination: %s\n' "$DEST"
  exit 0
fi
[[ $# -eq 0 ]] || fail "Usage: Install Opulent.command [--check]"
[[ ! -e "$DEST" && ! -L "$DEST" ]] || fail "An app already exists at $DEST. Quit it and move it to a backup location, then run this installer again. Your app data will be preserved."
mkdir -p "$DEST_DIR"
NEEDED_KB="$(du -sk "$SOURCE" | awk '{print $1}')"
FREE_KB="$(df -Pk "$DEST_DIR" | awk 'END {print $4}')"
[[ "$FREE_KB" -gt "$((NEEDED_KB + 262144))" ]] || fail "Free at least 1.5 GB before installing."
STAGING="$(mktemp -d "$DEST_DIR/.opulent-install.XXXXXX")"
cleanup() { [[ -z "${STAGING:-}" ]] || rm -rf -- "$STAGING"; }
trap cleanup EXIT
printf 'Installing Opulent to %s...\n' "$DEST"
/usr/bin/ditto "$SOURCE" "$STAGING/$APP_NAME"
/usr/bin/codesign --verify --deep --strict "$STAGING/$APP_NAME"
[[ ! -e "$DEST" && ! -L "$DEST" ]] || fail "The destination appeared during installation. Nothing has been replaced."
mv "$STAGING/$APP_NAME" "$DEST"
printf 'Installed at %s\n' "$DEST"
printf 'If macOS blocks launch, use System Settings > Privacy & Security > Open Anyway after reviewing the source.\n'
/usr/bin/open "$DEST" || { printf 'Installation finished. Open the app in Finder to complete macOS approval.\n'; exit 1; }
printf 'Launch requested. Confirm that the Opulent window opens.\n'
