#m.sh

This is a lightweight shell script to automate the (un)mounting process of drives in your system  
It replaced the usual function in my .bashrc.

##Install

Just download, make it executable and add it to your $PATH (or run in from anywhere)

    wget -q http://raw.github.com/g3orge/m.sh/master/m -O m
    chmod +x m
    mv m /usr/bin/

##Usage

with

    m c2

you can mount the /dev/sdc2 drive somewhere.  
Default drive is the b1 one.   
The script will create a dir if there isn't one    

Type m again to unmount it (it will remember the last drive used)

ATTENTION: it will run sudo internaly to mount the drive  

##License

This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar.
Click [here](http://sam.zoy.org/wtfpl/COPYING) for more details.
