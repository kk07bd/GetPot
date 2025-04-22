#! /usr/bin/env python
#    FILE: direct_follow.py
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
import os
import sys

sys.path.insert(0, os.path.abspath(".."))
from GetPot import GetPot
from sys import exit, argv

cl = GetPot(argv)

if cl.size() == 1 or cl.search("--help", "-h"):
    print() 
    print("Example to use direct_follow()-functions:")
    print("USAGE:")
    print("--help, -h  get some help about this program.")
    print() 
    print("-Ustring    specify user name as string") 
    print("-Vx         specify a value given as x")
    print("-NUMx       specify number given as x")
    print() 
    print("a total amount of three of each is expected.")
    print() 
    exit(0)

# Specify, that in case the cursor reaches the end of argument list,
# it is not automatically reset to the start. This way the search
# functions do not wrap around. Instead, they notify an 'not fount'
# in case the option was not in between 'cursor' and the argv.end().
cl.reset_cursor()
cl.disable_loop()

# check out 'const char*' versions
users = []
users.append(cl.direct_follow("Othman", "-U"))
users.append(cl.direct_follow("Charly", "-U"))
users.append(cl.direct_follow("Friedrich", "-U")) 


# check out 'double' versions
cl.reset_cursor();
values = []
values.append(cl.direct_follow(3.14, "-V"))
values.append(cl.direct_follow(9.81, "-V"))
values.append(cl.direct_follow(1.16, "-V"))

# check out 'integer' versions
cl.reset_cursor();
numbers = []
numbers.append(cl.direct_follow(10, "-NUM"))
numbers.append(cl.direct_follow(11, "-NUM"))
numbers.append(cl.direct_follow(12, "-NUM"))

for i in range(3):
    print("%s: \tID=%f \tV=%i" % (users[i], values[i], numbers[i]))





