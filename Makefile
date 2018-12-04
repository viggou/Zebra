include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/null.mk

all::
	xcodebuild -scheme Zebra archive -archivePath Zebra.xcarchive

after-stage::
	mv Zebra.xcarchive/Products/Applications $(THEOS_STAGING_DIR)/Applications
	rm -rf Zebra.xcarchive
	$(MAKE) -C Supersling
	mv $(THEOS_OBJ_DIR)/supersling $(THEOS_STAGING_DIR)/Applications/Zebra.app/

after-install::
	install.exec "killall \"Zebra\"" || true