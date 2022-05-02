obj-m += hid-nintendo.o

KERNEL_RELEASE := $(shell uname -r)
KDIR           := /lib/modules/$(KERNEL_RELEASE)/build

OBJ_FILE       := $(obj-m)
SRC_FILE       := $(OBJ_FILE:.o=.c)
CMD_FILE       := .$(OBJ_FILE).cmd
MODNAME        := $(OBJ_FILE:.o=)

all default: modules
install: modules_install

$(OBJ_FILE) $(MODNAME).ko: $(SRC_FILE)

modules modules_install clean $(OBJ_FILE) $(MODNAME).ko:
	$(MAKE) -C $(KDIR) M=$(CURDIR) $@

.PHONY: all default install modules modules_install clean
