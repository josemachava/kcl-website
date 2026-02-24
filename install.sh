#!/bin/sh
set -e

echo "Installing KCL..."

# Detect OS
OS=$(uname | tr '[:upper:]' '[:lower:]')

# Detect ARCH
ARCH=$(uname -m)

case $ARCH in
  x86_64) ARCH="amd64" ;;
  aarch64|arm64) ARCH="arm64" ;;
esac

BINARY="kcl-${OS}-${ARCH}"

BASE_URL="https://kcl-zuq70iw.onwolke.app/releases"
DOWNLOAD_URL="$BASE_URL/$BINARY"

echo "Detected: $OS-$ARCH"
echo "Downloading $DOWNLOAD_URL"

curl -fL "$DOWNLOAD_URL" -o kcl

chmod +x kcl

echo "Installing to /usr/local/bin..."

mkdir -p ~/.local/bin
mv kcl ~/.local/bin/kcl

echo "✅ KCL installed successfully!"
