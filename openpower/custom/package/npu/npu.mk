################################################################################
#
# npu
#
################################################################################

NPU_VERSION = 2d413ef2c5ee
NPU_SITE = git://github.com/rarbab/npu
NPU_LICENSE = GPL-2.0

$(eval $(kernel-module))
$(eval $(generic-package))
