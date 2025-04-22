#! /usr/bin/env python
#
#    FILE: nominus.py
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
#
######################################################################################
import os
import sys

sys.path.insert(0, os.path.abspath(".."))
from GetPot import GetPot
from sys    import *

cl = GetPot(argv);      # command line args

if cl.size() == 1 or cl.search("--help", "-h"):
    print() 
    print("Example to use nominus arguments:")  
    print("USAGE:")  
    print("--help, -h  get some help about this program.")  
    print() 
    print("any option that does not start with '-'")  
    print("will be printed on screen twice.")  
    print() 
    exit(0)
    
print("no. of nominus arguments = %i " % cl.nominus_size())

# print out all argument that do not start with a minus
nm = cl.next_nominus()     
while nm != None:
    print("[" + nm + "]"  '\t')
    nm = cl.next_nominus()     

# now get the whole vector at once
files = cl.nominus_vector()
for file in files:
    print("<" + file + ">")






