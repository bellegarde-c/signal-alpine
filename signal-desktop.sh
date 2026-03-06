#!/bin/sh

# app chooses config (including used endpoints) based on this
export NODE_ENV=production

gdbus call -e -d org.signal.Signal -o /org/signal/Signal -m org.signal.Signal.ShowWindow >/dev/null 2>&1 && exit 0

exec electron --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --wayland-text-input-version=3 /usr/lib/signal-desktop/app.asar "$@"
