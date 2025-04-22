#! /usr/bin/env python
#
#    FILE: variables.py
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
from GetPot import GetPot
from sys    import *

cl = GetPot(argv);      # command line args

# (1) search for multiple options with the same meaning
if cl.search("--help", "-h", "--hilfe", "--sos") or cl.size() == 1:
    print() 
    print("Example how to use GetPot to parse variables on the command line.")  
    print()  
    print("USAGE:")  
    print("--help, -h, --hilfe, --sos")  
    print("        get some help about this program.") 
    print("--internal-information, -i")  
    print("        show contents of database that was created by parser.")  
    print()        
    print("type a command line like the following:")  
    print(cl[0] + " string=otto.von.bismarck float=3.14 \\")  
    print("        integer=41 vector='1.26 something 0x40'")  
    print() 
    print("the variables that can be specified are:")  
    print("       float    a double variable")  
    print("       integer  an integer variable")  
    print("       string   a string variable")  
    print("       vector   a mixed type vector:")  
    print("                element 0 => double ")  
    print("                element 1 => string")  
    print("                element 2 => int")  
    print() 
    exit(0)

if cl.search("--internal-information", "-i"):
    cl.Print()
    exit(0);
        
# (2) some variables of each type
A_Number   = cl("float", 0.);
An_Integer = cl("integer", 0);
A_String   = cl("string", "default");

Element1 = cl("vector", 0., 0);
Element2 = cl("vector", "default", 1);
Element3 = cl("vector", 0, 2);

print("Specified Parameters:")  
print("float   = %f " % A_Number)
print("integer = %i " % An_Integer)  
print("string  = %s " % A_String)  
print() 
print("Vector elements:")  
print("Element 0 (double) = %f " % Element1)  
print("Element 1 (string) = %s " % Element2)  
print("Element 2 (int)    = %i " % Element3)  

