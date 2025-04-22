#! /usr/bin/env python
#    FILE: get.py Version 0.9
#    (C) 2001  Frank R. Schaefer
#
#    This library is free software; you can redistribute it and/or
#    modify it under the terms of the GNU Lesser General Public
#    License as published by the Free Software Foundation; either
#    version 2.1 of the License, or (at your option) any later version.
#
#    This library is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public
#    License along with this library; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
######################################################################################
from GetPot import GetPot
from sys import *

cl = GetPot(argv);

if cl.search("--help", "-h") :
    print()
    print("Example to show how to use the get function.")
    print()
    print("Example:")
    print("    " + cl[0] + " 3.14 otto blah 0x43")
    print()
    exit(0)
    
A = cl.get(4, 256);    # integer version of get()
B = cl.get(1, 3.14);   # double version of get()
C = cl.get(2, "You");  # string version of get()

print("A (argument no 4) = %i" % A) 
print("B (argument no 1) = %f" % B) 
print("C (argument no 2) = %s" % C) 

