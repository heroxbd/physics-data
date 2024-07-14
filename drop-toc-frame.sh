#!/bin/bash

tocline=$(grep -n '\tableofcontents' note.tex | cut -d: -f1)
sed -e "$((tocline-1))d" -e "$((tocline+1))d" -i $@
