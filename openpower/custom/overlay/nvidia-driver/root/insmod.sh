#!/bin/sh

SPEED=$(lsprop $(find /proc/device-tree/ -name ibm,nvlink-speed | head -1) | tail -1 | tr -d " \t")
SPEED_HEX=$(printf "0x%1x" 0x$SPEED)
KERNEL=$(uname -r)
NVIDIA_KO=$(find /lib/modules/$KERNEL/ -name nvidia.ko)
NVIDIA_UVM_KO=$(find /lib/modules/$KERNEL/ -name nvidia-uvm.ko)
NVREG="RMNvLinkSpeedControl=${SPEED_HEX};RMNumaOnlining=0x1;NVreg_RmMsg=nvlink"

set -x

insmod $NVIDIA_KO NVreg_RegistryDwords=$NVREG
insmod $NVIDIA_UVM_KO uvm8_ats_mode=1 uvm_enable_builtin_tests=1
nvidia-persistenced
export CUDA_6ad816b5=0x0b787d41e719
