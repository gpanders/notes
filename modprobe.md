# NAME

modprobe - Add and remove modules from the Linux Kernel

# EXAMPLES

## Adding in-tree kernel modules

The following demonstrates how to add a module found under `drivers/usb/serial`.

```console
cd /path/to/linux/source/tree
cd drivers/usb/serial
make -C /lib/modules/_uname -r_/build M=$(pwd)
sudo cp <module>.ko /lib/modules/_uname -r_/kernel/drivers/usb/serial/
sudo depmod
sudo modprobe <module>
```
