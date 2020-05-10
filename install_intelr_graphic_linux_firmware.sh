#!/bin/bash

cd

wget https://01.org/sites/default/files/downloads/intelr-graphics-linux/sklgucver61.tar.bz2 && \
tar xvjf sklgucver61.tar.bz2 && cd skl_guc_ver6_1/ && sudo ./install.sh

cd

wget https://01.org/sites/default/files/downloads/intelr-graphics-linux/kbldmcver101.tar.bz2 && \
tar xjvf kbldmcver101.tar.bz2 && cd kbl_dmc_ver1_01/ && sudo ./install.sh 

cd

sudo update-initramfs -u -k all