# NAME

modprobe - Add and remove modules from the Linux Kernel

# EXAMPLES

## Adding in-tree kernel modules

The following demonstrates how to add a module found under
`drivers/usb/serial`:

    cd /path/to/linux/source/tree
    cd drivers/usb/serial
    make -C /lib/modules/$(uname -r)/build M=$(pwd)
    sudo cp <module>.ko /lib/modules/$(uname -r)/kernel/drivers/usb/serial/
    sudo depmod
    sudo modprobe <module>
