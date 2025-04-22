#! /usr/bin/env python
#    FILE: flags.py
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
from sys import exit, argv
from GetPot import GetPot

cl = GetPot(argv)

if cl.size() == 1 or cl.search("--help", "-h")==1:
    print("Example using flags:")
    print() 
    print("USAGE:") 
    print("--help, -h  get some help about this program.") 
    print() 
    print("The first argument will be checked if it contains 'x' or 'X'.") 
    print("If so the first flag will be set. The second flag will be set if") 
    print("the first argument contains a 'c', 'C', 'k', or a 'K'.") 
    print() 
    print("The 'abc' flag is set when any argument starting with '-' contains an") 
    print("'a', 'b' or a 'c'.") 
    print() 
    exit(0)

# does first argument contain 'x', 'X', 'c', 'C', 'k', or  'K' ?
first_f  = cl.argument_contains(1, "xX");
second_f = cl.argument_contains(1, "cCkK");

# is there any option starting with '-' containing 'a', 'b', or 'c' ?
abc_f = cl.options_contain("abc");

print("first flag  = %i "      % first_f) 
print("second flag = %i"       % second_f) 
print("a, b, or c found = %i " % abc_f) 

