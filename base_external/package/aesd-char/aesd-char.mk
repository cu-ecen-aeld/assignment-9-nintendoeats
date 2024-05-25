
##############################################################
#
# aesd-char driver
#
##############################################################

AESD_CHAR_VERSION = 133a38e866aca25f32cc72533422277fc5d420c4
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_CHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-nintendoeats.git
AESD_CHAR_SITE_METHOD = git
AESD_CHAR_GIT_SUBMODULES = YES

AESD_CHAR_MODULE_SUBDIRS = aesd-char-driver/
AESD_CHAR_MAKE_OPTS = KVERSION$(LINUX_VERSION_PROBED) KERNELDIR=$(LINUX_DIR)

AESD_CHAR_CONFIGURE_OPTS += KERNELDIR=$(LINUX_DIR)
AESD_CHAR_CONFIGURE_OPTS += ARCH=$(KERNEL_ARCH)
AESD_CHAR_CONFIGURE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)

define AESD_CHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))