#!/usr/bin/env bash

set -e
set -o pipefail
IFS=$'\n'

# testing few additional things
# Using custom aliases 
pro # should open ~/Projects
.. # should run cd ..

# using custom functions
mcd Test # should create folder Test and open it

# check git config
if $(git config --global user.name) == "Anton Efimov" ; then
    return 0
else
    return 1
fi

# check installed brew packages
tldr -v