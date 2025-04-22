#! /usr/bin/env python
#
#    FILE: filter.py
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
from sys    import *
import os
import sys

sys.path.insert(0, os.path.abspath(".."))
from GetPot import GetPot

cl = GetPot(argv)
ifpot = GetPot(Filename="example.pot")
               
# (1) search for multiple options with the same meaning
if cl.search("--help", "-h", "--hilfe", "--sos"):
    msg = "Example program treating the prefix filtering.\n\n" \
          "   Using the function .set_prefix(section) only arguments, options \n" \
          "   variables are considered in the given 'section'\n\n" \
          "--help, -h, --hilfe, --sos \n" \
          "       this page.\n" \
          "--nice \n" \
          "       demonstrates how pseudo function calls can be accomplished.\n\n" \
          "please refer to the file 'example.pot' as input file.\n"
          
    print(msg)          
    
    exit(0)
        
#  -- note that the prefix is not considered as a flag
#  -- the index in 'argument contains' indicates the position
#     of the argument inside the namespace given by prefix
ifpot.set_prefix("group/")

print(" -- flags in options / arguments")
first_f  = ifpot.argument_contains(1, "xX")
second_f = ifpot.argument_contains(1, "cCkK")
abc_f    = ifpot.options_contain("abc")
print("    Flags in first argument in [flags]\n")
print("    x or X in arg 1       = %i " % first_f)
print("    c, C, k or K in arg 1 = %i " % second_f)
print("    a,b, or c in options  = %i " % abc_f)
print() 
print(" -- search(), next() and follow()")
print()
print("    found \"--rudimental\" = %i " % ifpot.search("--rudimental"))
print("    followed by %i and %i" % ( ifpot.next(-1), ifpot.next(-1) ))
print("    rudimental = %s %i" % ( ifpot.follow("nothing", "--rudimental"), ifpot.next(-1)))

#  -- variables
print()
print(" -- variables in section [user-variables]")
print()
ifpot.set_prefix("user-variables/")
for v in ifpot.get_variable_names():
    print("   ", v, "   \t= ", ifpot(v, 1e37, 0), "[", ifpot(v, "[1]", 1), "]")
print()
#  -- pseudo function calls
if cl.search("--nice"):
    print(" -- pseudo function call feature")
    print()
    ifpot.set_prefix("pseudo-function-calls/")
    # ifpot.Print()
    ifpot.init_multiple_occurrence()

    ifpot.search("LE-DEBUT")
    while 1 + 1 == 2:
        next = ifpot.next("(no-func)")

        if   next == "(no-func)": break
        elif next == "rectangle":
            size_x = ifpot.next(10)
            size_y = ifpot.next(10)
            stdout.write("\n")
            for y in range(size_y):
                for x in range(size_x-2):
                    stdout.write("*")
                stdout.write("\n")

        elif next == "circle":
            radius = ifpot.next(4)
            stdout.write("\n")
            for y in range(radius*2+1):
                for x in range(radius*2+1):
                    if (x-radius)**2 + (y-radius)**2 <= radius**2 and \
                       (x-radius)**2 + (y-radius)**2 >= radius**2/4:
                        stdout.write(".")
                    else: stdout.write(" ")
                stdout.write("\n")

        elif next == "smiley":
            mood = ifpot.next("happy")
            if   mood == "sad": stdout.write(":( ")
            else:               stdout.write(":) ")

        elif next == "new-line":
            no = ifpot.next(1)
            for i in range(no): stdout.write("\n")

else:
    print("(use the --nice command line flag for graphical output)")
print()


