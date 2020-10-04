TARGET := iphone:clang:13.0:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SmileyProviderPrefs

SmileyProviderPrefs_FILES = SMPRootListController.m
SmileyProviderPrefs_FRAMEWORKS = UIKit
SmileyProviderPrefs_PRIVATE_FRAMEWORKS = Preferences
SmileyProviderPrefs_INSTALL_PATH = /Library/PreferenceBundles
SmileyProviderPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
