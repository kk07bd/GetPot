#! /usr/bin/env python
#    FILE: next.py
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

if cl.size() == 1 or cl.search("--help", "-h"):
    print() 
    print("Example to use next()-functions:")
    print("USAGE:")  
    print("    $1  (double) Value of A")  
    print("    $2  (integer) Value of B")  
    print("    $3  (string) Name to be printed")  
    print("    $4  (integer) Some number to be printed")  
    print() 
    exit(0);

# read arguments one by one on the command line
#  (lazy command line parsing)
cl.reset_cursor()
A = cl.next(0.)    # [rad]
B = cl.next(256)   # [1/s]
User = cl.next("You")
No   = cl.next(0x42) 

print() 
print("A = %f" % A)  
print("B = %i" % B)  
print("Name           = %s" % User)
print("Special number = %i" % No)  
print() 





