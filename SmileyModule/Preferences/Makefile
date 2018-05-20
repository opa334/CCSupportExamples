include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SmileyModulePrefs
SmileyModulePrefs_FILES = SMPRootListController.m
SmileyModulePrefs_INSTALL_PATH = /Library/PreferenceBundles
SmileyModulePrefs_FRAMEWORKS = UIKit
SmileyModulePrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SmileyModulePrefs.plist$(ECHO_END)
