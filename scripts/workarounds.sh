#!/usr/bin/env bash
set -o errexit
device="$1"
version="$2"
dest_folder="$3"

# Workaround for x86_64 images. Tools compiled expecting /lib/ld-linux-x86-64.so.2 while it is in /lib64 in Debian
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
  if [ ! -f /lib/ld-linux-x86-64.so.2 ]; then
    ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2
  fi
fi

if [[ "$device" == asus-tinker* ]]; then
  echo "Workaround tinkerboard"
  # Specific for the Asus Tinkerboard
  # Check for config option CONFIG_ARCH_ROCKCHIP and
  # if set remove the line that sets the default ARCH
  # inside the Makefile
  if grep -q "CONFIG_ARCH_ROCKCHIP=y" "$dest_folder/.config"; then
    sed -i '/?= arm64/d' "$dest_folder/Makefile"
  fi
fi

if [[ "$device" == beagle* ]]; then
  echo "Workaround bbb"
  wget https://raw.githubusercontent.com/beagleboard/linux/4.14/arch/arm/kernel/module.lds -O "$dest_folder"/arch/arm/kernel/module.lds
fi

if [[ "$device" == ts4900 ]]; then
  echo "Workaround ts4900"
  # Workaround for the ts4900 to deal with unknown relocation error
  # when build OOT modules
  if grep -q "ts4900" "$dest_folder/arch/arm/boot/dts/Makefile"; then
    sed -i 's/^CFLAGS_MODULE \+=/CFLAGS_MODULE += -fno-pic/g' "$dest_folder/Makefile"
  fi
fi

# Example workaround for a specific device type and OS version
if [ "$device" == "example_device" ] && [ "$version" == "2.90.5+rev1.prod" ]; then
  info "Applying workaround for example_device at version 2.90.5+rev1.prod"
  # Add necessary commands here
fi