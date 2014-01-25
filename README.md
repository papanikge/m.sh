#m.sh

Simple script to unmount all removable drives currently mounted on /mnt and /media  

Although, if you give it the drive's callsigns (i.e.: b1 for /dev/sdb1) it will mount it.  

The name comes from 'mount' of course because prior to the current version this
tool's purpose was to automate the (un)mounting process of drives in a system.
But then I discovered and started using udev rules and you have no reason to do
so as well. (You can also use something like udiskie)

##Install

Just download, make it executable and add it to your $PATH (or run in from anywhere)

    wget -q http://raw.github.com/papanikge/m.sh/master/m -O m
    chmod +x m
    mv m /usr/bin/ # optional in order to put it into your path

##Usage

I don't believe you're that lazy for this script...

##License

This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar.
Click [here](http://sam.zoy.org/wtfpl/COPYING) for more details.
