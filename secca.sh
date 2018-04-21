#!/bin/bash
#filename        :secca.sh
#title		 :Supercapacitors Equivalent Capacity CAlculator
#description     :This script estimates how much (equivalent) capacity a supercap has.
#author		 :zakkos (Valerio Sacchetto)
#date            :20180401
#version         :0.1    
#usage		 :./secca.sh || bash secca.sh
#notes           :Uses "bc" for floating point calculations.
#bash_version    :4.3.48(1)-release
#==============================================================================

#Equivalent capacity calculator:

#::DISCLAIMER::
#This is just an approximation!

#It works by calculating first the joule (Watts per second -> 1/2CV^2)  
#content of the given capacitor between $vmax and $vmin
#and then converting it to mAh at the mean voltage between $vmax and $vmin. 
#
#Capacitors work very differently than batteries
#so the result is not perfect but it's a ballpark figure.
#As an extra, if a constant power consumption is given, an estimated lifetime 
#is computed.

echo "Capacitance in Farads:"
read cap
echo "Upper voltage limit:"
read vmax
echo "Lower voltage limit:"
read vmin

Emax=$(bc -l <<< "$cap*($vmax^2)*0.5")
Emin=$(bc -l <<< "$cap*($vmin^2)*0.5")

echo "Equivalent capacity:"
mah=$(bc -l <<< "((($Emax-$Emin)/3600)*1000)/(($vmax+$vmin)/2)")
echo "$(bc <<< "scale=2;$mah/1")mAh"

echo "Constant/mean power consumption in mA (leave empty to exit):"
read absorption
if [ ${#absorption} -eq 0 ]
then
	echo "Goodbye!"
	exit 0
else
	hr=$(bc <<< "scale=3;$mah/$absorption")
	minutes=$(bc <<< "scale=3;$hr*60")
	seconds=$(bc <<< "scale=0;($minutes*60)%60")
	echo "Duration: $hr hrs or $(bc <<< "scale=0;$minutes/1") minutes and $seconds seconds"
fi
