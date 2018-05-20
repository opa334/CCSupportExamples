include $(THEOS)/makefiles/common.mk

export TARGET = iphone:clang:11.2:11.0
export ARCHS = arm64

BUNDLE_NAME = CydiaLauncherModule
CydiaLauncherModule_FILES = CydiaLauncherModule.m
CydiaLauncherModule_BUNDLE_EXTENSION = bundle
CydiaLauncherModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CydiaLauncherModule_INSTALL_PATH = /Library/ControlCenter/Bundles/

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/bundle.mk
