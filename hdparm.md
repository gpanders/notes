# NAME

hdparm - modify parameters of storage devices

## Removing the read-only attribute of an SD card

Sometimes an SD card can get "stuck" in read-only mode. First, double check
that the physical write protection on the SD card is not enabled. If it is not,
and your OS is still mounting the SD card as read-only, you can try this (the
following example assumes the SD card is at device **sdd**):

    # hdparm -r0 /dev/sdd1
    # mount -o remount,rw /dev/sdd1



