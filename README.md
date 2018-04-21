# secca 0.1
Supercapacitors Equivalent Capacity CAlculator

**This script estimates how much (equivalent) capacity a supercap has.**

### Usage:
```
$ ./secca.sh
```
or
```
$ bash secca.sh
```
you'll then be prompted for a few informations:
* capacitance in Farads
* maximum voltage the cap will be charged to
* minimum useful voltage for your application

### How it works:
It works by calculating first the joule (Watts per second -> 1/2CV^2) content of the given capacitor between $vmax and $vmin and then converting it to mAh at the mean voltage between $vmax and $vmin. 

Capacitors work very differently than batteries so the result is not perfect but just a ballpark figure.

As an extra, if a constant power consumption is given, an estimated "lifetime" is computed.

### Notes:           
Uses "bc" for floating point calculations.

### Bash version:    
4.3.48(1)-release

### ::DISCLAIMER::

The result is just an approximation!

### License and Copyright

See [`LICENSE`](LICENSE).
