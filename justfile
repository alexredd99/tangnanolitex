# Tools
_uv  := require("uv")

_default:
  @just --list

[group("Setup")]
install:
  # Recursively clone dependencies
  git submodule update --init --recursive --depth 1
  # git submodule update --init --recursive --depth 1 third_party/migen
  # git submodule update --init --recursive --depth 1 third_party/pythondata-software-picolibc
  # git submodule update --init --recursive --depth 1 third_party/pythondata-misc-usb_ohci
  # git submodule update --init --recursive --depth 1 third_party/pythondata-cpu-vexriscv-smp
  # Install Python packages
  {{_uv}} sync

# --rootfs=mmcblk0p2

build_tang_nano:
  {{_uv}} run ./third_party/linux-on-litex-vexriscv/make.py \
    --cpu-count=1 \
    --board=sipeed_tang_nano_20k \
    --build