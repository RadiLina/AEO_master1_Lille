#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/local/xilinx-vivado/SDK/2018.2/bin:/local/xilinx-vivado/Vivado/2018.2/ids_lite/ISE/bin/lin64:/local/xilinx-vivado/Vivado/2018.2/bin
else
  PATH=/local/xilinx-vivado/SDK/2018.2/bin:/local/xilinx-vivado/Vivado/2018.2/ids_lite/ISE/bin/lin64:/local/xilinx-vivado/Vivado/2018.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/local/xilinx-vivado/Vivado/2018.2/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/local/xilinx-vivado/Vivado/2018.2/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/m1/radi/Documents/aeo/Tp1/tp1.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .write_bitstream.begin.rst
EAStep vivado -log my_add.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source my_add.tcl -notrace

