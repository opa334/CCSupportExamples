TARGET := iphone:clang:13.7:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SmileyProvider
SmileyProvider_BUNDLE_EXTENSION = bundle
SmileyProvider_FILES = SmileyProvider.m ProvidedSmileyModule.m ProvidedSmileyModuleRootListController.m
SmileyProvider_PRIVATE_FRAMEWORKS = ControlCenterUIKit Preferences
SmileyProvider_INSTALL_PATH = /Library/ControlCenter/CCSupport_Providers
SmileyProvider_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
SUBPROJECTS += SmileyProviderPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
