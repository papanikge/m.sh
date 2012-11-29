#!/bin/bash
# A script for handling drive mounting

# in case of requesting help
if [[ $1 == "-h" ]]; then
    echo "  m <drive letter>[<partition number>]"
    echo "  Example: m b1 (for /dev/sdb1)"
    return
fi

# parsing arguments
if [[ $# -eq 0 ]]; then
    if [[ -x ~/.m ]]; then
        DRIVE=$(head -1 ~/.m)
    else
        # default is second drive: /dev/sdb1
        DRIVE="b1"
    fi
else
    ARG=$1
    # using the length of the first argument to check
    # if the user gave the whole code of just the letter
    if [[ ${#ARG} -eq 1 ]]; then
        # adding the 1 (first partition)
        DRIVE=$11
    else
        DRIVE=$1
    fi
fi

# does the drive exist?
ls /dev/sd$DRIVE &>/dev/null
if [[ $? -eq 2 ]]; then
    echo "Drive doesn't exist. Aborting."
    return
fi

# is it mounted?
df | grep "sd$DRIVE" &>/dev/null
if [[ $? -eq 1 ]]; then
    # Not mounted
    # TODO: Options for destinations
    DESTINATION="/mnt/St"
    sudo mount /dev/sd$DRIVE $DESTINATION
    echo "### Mounted /dev/sd$DRIVE on $DESTINATION"
else
    # Already mounted
    WHERE=$(df | grep "sd$DRIVE" | awk '{ print $NF }')
    sudo umount $WHERE
    echo "### Unmounted /dev/sd$DRIVE"
fi

# Save the drive name for later
echo $DRIVE > ~/.m
