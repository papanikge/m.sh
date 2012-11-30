#!/bin/bash
# A script for handling drive mounting

# in case of requesting help
if [[ $1 == "-h" ]]; then
    echo "  m <drive letter>[<partition number>]"
    echo "  Example: m b1 (for /dev/sdb1)"
    kill $$
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
    kill $$
fi

# is it mounted?
df | grep "sd$DRIVE" &>/dev/null
if [[ $? -eq 1 ]]; then
    # Not mounted
    # default destination:
    DESTINATION="/mnt/St"

    # using mountpoint to find one
    ls -1 /mnt > ~/.mtemp
    cat ~/.mtemp | while read -r line
    do
        mountpoint -q /mnt/$line
        if [[ $? -eq 1 ]]; then
            # saving to a file so we can get it after the loop.
            # see 'disappearing variables' (Bash is weird)
            echo "mnt/${line}" > ~/.mtemp
            break
        fi
    done
    DESTINATION=$(cat ~/.mtemp)

    rm ~/.mtemp
    sudo mount /dev/sd$DRIVE $DESTINATION
    if [[ $? -eq 0 ]]; then
        echo "### Mounted /dev/sd$DRIVE on $DESTINATION"
    fi
else
    # Already mounted
    WHERE=$(df | grep "sd$DRIVE" | awk '{ print $NF }')
    sudo umount $WHERE
    if [[ $? -eq 0 ]]; then
        echo "### Unmounted /dev/sd$DRIVE"
    fi
fi

# Save the drive name for later
echo $DRIVE > ~/.m

# do we need to unset?
unset DRIVE
unset DESTINATION
unset line
unset WHERE
unset ARG
