#m.sh

This is a shell script to automate the (un)mounting proccess of drives,  
that replaced the usual alias in my .bashrc.

##Install

Just download, make it executable and add it to your $PATH (or run in from anywhere)

    wget -q http://raw.github.com/g3orge/m.sh/master/m -O m && chmod +x m && sudo mv m /usr/bin

##Usage

Just type m and c2 for example to mount the /dev/sdc2 drive somewhere.  
default drive is the b1 one. (the script will create a dir if there isn't one)  
Type m again to unmount it.

(needs administrator privileges) 

##License

This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar.
See [1] for more details.

[1]: http://sam.zoy.org/wtfpl/COPYING
