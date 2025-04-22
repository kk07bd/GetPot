#! /usr/bin/env python
#    FILE: follow.py
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

if cl.size() == 1 or cl.search("--help", "-h", "--hilfe", "?"): 
    print() 
    print("Example to use follow()-functions:") 
    print("USAGE:")  
    print("--help, -h, --hilfe, ?")  
    print("       get some help about this program.")  
    print("--alpha number")  
    print("       specify the value of alpha given as number.")  
    print("--beta number")  
    print("       specify the value of beta given as number.")  
    print("--user, -u string number")  
    print("       specify user name as string and id as number")  
    print("       (default = 'You' and '0x42').")  
    print("       multiple users possible. ")  
    print("--size, --sz, -s number1 number2")  
    print("       specify x and y sizes")  
    print() 
    exit(0);

# read arguments one by one on the command line
#  (lazy command line parsing)
Alpha = cl.follow(0., "--alpha") # [rad]
Beta  = cl.follow(256,"--beta")  # [1/s]

cl.init_multiple_occurrence()
User  = cl.follow("You", "--user", "-u");      
No    = cl.next(0x42); 
User2 = cl.follow("You Two", "--user", "-u"); # second user specified ?
No2   = cl.next(0x43); 

cl.enable_loop();
XSz = cl.follow(0.,"--size", "--sz", "-s"); # [cm]
YSz = cl.next(0.);                          # [cm]

cl.Print()
print()
print("Alpha = %f" % Alpha)
print("Beta  = %i" % Beta)
print("Names = %s and %s" % (User, User2))
print("Special numbers = %i and %i" % (No, No2))
print("x-size, y-size = (%f, %f)" % (XSz, YSz))
print()
