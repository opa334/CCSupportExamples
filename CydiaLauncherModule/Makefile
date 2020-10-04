TARGET := iphone:clang:13.0:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CydiaLauncherModule
CydiaLauncherModule_FILES = CydiaLauncherModule.m
CydiaLauncherModule_BUNDLE_EXTENSION = bundle
CydiaLauncherModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CydiaLauncherModule_INSTALL_PATH = /Library/ControlCenter/Bundles/

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/bundle.mk
