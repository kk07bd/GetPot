#! /usr/bin/env python
#    FILE: options.py
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

cl = GetPot(argv)

# (1) search for a single option
# -------------------------------
#     check if the '--do-nothing' flag is set and exit if yes
if cl.search("--do-nothing")==1 : exit(0)

#     does the user want us to be nice ... ?
be_nice_f = cl.search("--nice")

# (2) search for multiple options with the same meaning
if cl.size() == 1 or cl.search("--help", "-h", "--hilfe", "--sos"):
    print() 
    print("Example to use search()-functions:")
    print()  
    print("USAGE:")  
    print("--do-nothing   quit without doing anything.")  
    print("--nice         write a nice phrase on the terminal.")  
    print("--help, -h, --hilfe, --sos")  
    print("               get some help about this program.")  
    print("--beep, -b, --piepse, --bip, --senal-acustica")  
    print("               get your system to make a beep.")  
    print()
    exit(0)

if cl.search("--beep", "--piepse", "--bip", "--senal-acustica", "-b"):
    print("\a");

print("Program terminated.")

if be_nice_f == 1:
    print("Have a nice day.")









