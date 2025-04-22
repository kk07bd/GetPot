#! /usr/bin/env python
#     FILE: ufo.py Version 0.9
#     (C) 2001-2002  Frank R. Schaefer
# 
#     This library is free software; you can redistribute it and/or
#     modify it under the terms of the GNU Lesser General Public
#     License as published by the Free Software Foundation; either
#     version 2.1 of the License, or (at your option) any later version.
# 
#     This library is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#     Lesser General Public License for more details.
# 
#     You should have received a copy of the GNU Lesser General Public
#     License along with this library; if not, write to the Free Software
#     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#######################################################################################
from sys import *
from GetPot import GetPot

def print_help():
    print("USAGE:  ufo.py [--help] [--arguments] [--options] [--flags] [--sections]")
    print("               [--variables] [--nominuses [-i file] [-o filename]]")
    print("               ... any arguments")
    print() 
    print("PURPOSE: ")
    print("        Testing the GetPot's ability to detect unknown flying objects")
    print("         (i.e. un-recognized command line arguments. The type of flying")
    print("        object you want to check for is specified through one of the")
    print("        following options:")
    print() 
    print("        --arguments")
    print("             test all arguments against an internal list of possible arguments.")
    print() 
    print("        --options")
    print("             test all options (arguments starting with at least one '-') against")
    print("             an internal list of options.")
    print() 
    print("        --flags")
    print("             test first argument and all options against internal list of flags")
    print("             (i.e. letters in arguments that act as switches)")
    print() 
    print("        --sections")
    print("             reads the input file 'example.pot' for sections that are")
    print("              unidentified. add some sections yourself to test this feature.")
    print() 
    print("        --variables")
    print("             tests all variables specified on the command line against a list")
    print("             of specified variables.")
    print() 
    print("        --nominuses")
    print("             check for unrecognized nominuses. filenames after -i and -o are")
    print("             recognized.")
    print() 
    print("        Once you specified your mode add any number of command line")
    print("        arguments and watch the output.")
    print() 
    print("EXAMPLES:") 
    print("        > ./ufo.py yes no -i source.cpp --arguments") 
    print() 
    print("        > ./ufo.py -i source.cpp --force n=13 -xzt --options") 
    print() 
    print("        > ./ufo.py zfd if=source.cpp force n=13 -l -zrt -olp --flags") 
    print() 
    print("        > ./ufo.py zfd x=12 y=234 loength=21 height=21 n=2 --variables") 
    print() 
    print("        > ./ufo.py --sections # (edit file section labels in example.pot)") 
    print() 
    print("        > ./ufo.py n=21 -i in.dat -o out.dat /etc/fstab force --nominuses") 
    print() 
    print("AUTHOR: (C) 2002 Frank R. Schaefer\n");




cl   = GetPot(argv)

if cl.search("-h", "--help"):
    print_help()
    exit(0)

elif cl.search("--arguments"):
    #  (*) unidentified flying arguments ---------------------------------------------
    ufos = cl.unidentified_arguments("--arguments", "-h", "--help", "yes", "no")
    print("Unidentified Arguments (other than '--arguments', '-h', '--help', 'yes', 'no'):\n")

elif cl.search("--options"):
    #  (*) unidentified flying options (starting with '-' or '--') -------------------
    ufos = cl.unidentified_options("--options",  "-h", "--help",
                                   "yes(ignored anyway)", "no(ignored anyway)")
    print("Unidentified Options (different from '--options',  '-h', '--help'):")

elif cl.search("--flags"):
    #  (*) unidentified flying flags -------------------------------------------------

    #  -- flags in the first argument
    ufos = cl.unidentified_flags("xzfjct", 1)
    print("-- Unaccepted flags in argument 1:\n")
    for flag in ufos:
        print("      '%c'" % flag)

    print("\n   Accepted flags: 'x' 'z' 'f' 'j' 'c' 't'\n")

    #  -- flags in arguments starting with a single '-'
    ufos = cl.unidentified_flags("ltrm")
    print("-- Unaccepted flags in options (argument with one '-'):")
    for flag in ufos:
        print("      '%c'" % flag)

    print("\n   Accepted flags in options: 'l' 't' 'r' 'm'")
    exit(0)
    
elif cl.search("--variables"):
    #  (*) unidentified flying variables ---------------------------------------------
    ufos = cl.unidentified_variables("x", "y", "z", "length", "height")
    
    print("Unidentified Variables (other than 'x', 'y', 'z', 'length', 'height'):")

elif cl.search("--sections"):
    #  (*) unidentified flying sections ----------------------------------------------
    ifile = GetPot(Filename="example.pot")
    ufos = ifile.unidentified_sections("vehicle/", 
                                       "vehicle/tires/", 
                                       "vehicle/chassis/",
                                       "vehicle/chassis/doors/",
                                       "group/",
                                       "other/",
                                       "user-variables/",
                                       "pseudo-function-calls/")
    
    print("Unidentified sections in file 'example.pot':")
    if len(ufos) == 0:
        print("    (none) add [..] section labels in file 'example.pot'.")

elif cl.search("--nominuses"):
    #  (*) unidentified flying options (starting with '-' or '--') -------------------
    tmp = []
    #  -- read two filenames for demonstration purposes
    infile = cl.follow("default-in.znf", "-i")
    outfile = cl.follow("default-out.znf", "-o")    
    tmp.append(infile)
    tmp.append(outfile)
    
    #  -- get any other nominuses not used until now
    ufos = cl.unidentified_nominuses(tmp)

    print("Unused Nominus Arguments (other than arguments after -i and -o):")

else:
    print_help()
    exit(0)


# (*) print out unidentified flying objects
for ufo in ufos:
    print("     " + ufo)

