#! /usr/bin/env python
#
#    FILE: expand.py 
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
ifpot = GetPot(Filename='expand.pot')

if cl.search("--internal-information", "-i"):
    ifpot.Print();
    exit(0);

# (*) help display
if cl.search("--help", "-h", "--hilfe", "--sos") or cl.search("--ok") == 0:     
    msg = "Example how to use GetPot to parse input files.\n\n" + \
          "USAGE:\n" + \
          "--ok\n" + \
          "        run the input file parsing.\n" + \
          "--help, -h, --hilfe, --sos\n" + \
          "        get some help about this program.\n\n" + \
          "--internal-information, -i\n" + \
          "        show contents of database that was created by file parser.\n" + \
          "--infile string\n" + \
          "        input file name (default: example.pot)"
    print(msg)
    exit(0);

# (*) example usage
print("[1.1]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "nobody"))  

ifpot.set_prefix("1.2/")
print("[1.2]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))

ifpot.set_prefix("1.3/")
print("[1.3]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))

ifpot.set_prefix("1.4/")
print("[1.4]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))

ifpot.set_prefix("2.1/")
print("[2.1]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))
print("Information 2: %s" % ifpot("info2", "(nothing)"))

ifpot.set_prefix("2.2/")
print("[2.2]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))

ifpot.set_prefix("2.3/")
print("[2.3]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))
print("Information 2: %s" % ifpot("info2", "(nothing)"))

ifpot.set_prefix("3.1/")
print("[3]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))
print("Information 2: %s" % ifpot("info2", "(nothing)"))
print("Information 3: %s" % ifpot("info3", "(nothing)"))
print("Information 4: %s" % ifpot("info4", "(nothing)"))
print("Information 5: %s" % ifpot("info5", "(nothing)"))
print("Information 6: %s" % ifpot("info6", "(nothing)"))
print("Information 7: %s" % ifpot("info7", "(nothing)"))

ifpot.set_prefix("3.2/")
print("[3.2]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))

ifpot.set_prefix("3.3/")
print("[3.3]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))
print("Information 2: %s" % ifpot("info2", "(nothing)"))
print("Information 3: %s" % ifpot("info3", "(nothing)"))
print("Information 4: %s" % ifpot("info4", "(nothing)"))
print("Information 5: %s" % ifpot("info5", "(nothing)"))
print("Information 6: %s" % ifpot("info6", "(nothing)"))
print("Information 7: %s" % ifpot("info7", "(nothing)"))

ifpot.set_prefix("3.4/")
print("[3.4]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))
print("Information 2: %s" % ifpot("info2", "(nothing)"))

ifpot.set_prefix("3.5/")
print("[3.5]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))
print("Information 2: %s" % ifpot("info2", "(nothing)"))
print("Information 3: %s" % ifpot("info3", "(nothing)"))
print("Information 4: %s" % ifpot("info4", "(nothing)"))
print("Information 5: %s" % ifpot("info5", "(nothing)"))
print("Information 6: %s" % ifpot("info6", "(nothing)"))
print("Information 7: %s" % ifpot("info7", "(nothing)"))

ifpot.set_prefix("3.6/")
print("[3.6]--------------------------------------------------------------------------")
print("Information 0: %s" % ifpot("info0", "(nothing)"))
print("Information 1: %s" % ifpot("info1", "(nothing)"))

