#! /usr/bin/env python
#    FILE: input-file.py 
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
from sys    import *

cl = GetPot(argv);      # command line args
ifpot = GetPot(Filename='example.pot')

if cl.search("--internal-information", "-i"):
    ifpot.Print();
    exit(0);

# (1) search for multiple options with the same meaning
if cl.search("--help", "-h", "--hilfe", "--sos") or cl.search("--ok") == 0:
    print() 
    print("Example how to use GetPot to parse input files.")  
    print()  
    print("USAGE:")  
    print("--ok")  
    print("        run the input file parsing.")    
    print("--help, -h, --hilfe, --sos")  
    print("        get some help about this program.")    
    print()          
    print("--internal-information, -i")  
    print("        show contents of database that was created by file parser.");
    print() 
    print("--infile string")  
    print("        input file name (default: example.pot)")          
    print() 
    exit(0);

# (2) playing with sections
print(ifpot("hello-string", "guten tag."))  
print("webpage    = %s" % ifpot("webpage", "nothing.somewhere.idn"))  
print("user          = %s" % ifpot("user", "nobody"))  
print("dos-file      = %s" % ifpot("dos-file", "nobody"))  
print("latex-formula = %s" % ifpot("latex-formula", "nobody"))  

print("no. clicks = %i" % ifpot("clicks", 0))  
print("acceleration = %f" %  ifpot("acceleration", 3.14))  

print("vehicle/wheel-base = %f" % ifpot("vehicle/wheel-base",2.65))  
x = ifpot("vehicle/initial-xyz",0., 0)  # first element of vector
y = ifpot("vehicle/initial-xyz",0., 1)  # second element of vector 
z = ifpot("vehicle/initial-xyz",0., 2)  # third element of vector

print("vehicle/initial-xyz = %f, %f, %f" % (x, y, z))

print("vehicle/tires/B = %f" % ifpot("vehicle/tires/B", 976))  
print("              C = %f" % ifpot("vehicle/tires/C", 5))  
print("              E = %f" % ifpot("vehicle/tires/E", 5))  
print("              D = %f" % ifpot("vehicle/tires/D", 22.404))  

print("vehicle/chassis/Roh = %f" % ifpot("vehicle/chassis/Roh", 1.21))  
print("                S   = %f" % ifpot("vehicle/chassis/S"  , 14.0))  
print("                Cd  = %f" % ifpot("vehicle/chassis/Cd" , 0.45))  

print("vehicle/chassis/doors/number = %i" % ifpot("vehicle/chassis/doors/number",2))  
print("                      locks  = %s" % ifpot("vehicle/chassis/doors/locks","yes"))  

# (3) playing with things we do normally only with command line arguments
n_f = ifpot.search("--nonsense", "-n", "--unsinn", "--sans-sense");
print("x-ratio       = %f" % ifpot.follow(3.14, "vehicle/-x"))  
print("sound-mode    = %s" % ifpot.next("none"))  

print("nonsense-flag = %i" % n_f)
