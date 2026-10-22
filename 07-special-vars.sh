#!/bin/bash
echo "all args passed to the script $@"
echo "all args assed to the script as word $*"
echo "number of args passed to the script $#"
echo "first variable passed $1"
echo "scriptname $0"
echo "real path $(realpath $0)"
echo "who is running the script $USER"
echo "directory of curent script  $PWD"
echo "home directory of current user $HOME"
echo "pid of the current script $$"
sleep 10 &
echo "pid of background command $!"
wait $!
echo "linenumber $LINENO"
echo "previous command exit status $?"
echo "total time $SECONDS second"
