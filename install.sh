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

BASE_URL=" https://kcl.wolke.host/releases"
DOWNLOAD_URL="$BASE_URL/$BINARY"

echo "Detected: $OS-$ARCH"
echo "Downloading $DOWNLOAD_URL"

curl -fL "$DOWNLOAD_URL" -o kcl

chmod +x kcl

echo "Installing to /usr/local/bin..."

sudo mv kcl /usr/local/bin/kcl

echo "✅ KCL installed successfully!"
kcl --version || true