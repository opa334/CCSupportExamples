include $(THEOS)/makefiles/common.mk

export TARGET = iphone:clang:11.2:11.0
export ARCHS = arm64

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
