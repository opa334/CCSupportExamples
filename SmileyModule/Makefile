TARGET := iphone:clang:13.0:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SmileyModule
SmileyModule_BUNDLE_EXTENSION = bundle
SmileyModule_FILES = SmileyModule.m SmileyModuleRootListController.m
SmileyModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit Preferences
SmileyModule_CFLAGS = -fobjc-arc
SmileyModule_INSTALL_PATH = /Library/ControlCenter/Bundles/

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/bundle.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
