ruby/                                                                                               0000755 0001750 0001750 00000000000 13177705753 011636  5                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                ruby/README                                                                                         0000755 0001750 0001750 00000001737 13177705753 012531  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                GetPot - Ruby:
--------------

This is the Ruby port of the popular GetPot library for 
command line and input file parsing. Currently only
a C++ documentation is available. The files in the 
'examples' directory should be enough, though, to be 
able to use this library. It is fairly easy to use.

Further information is available at:

             http://getpot.sourceforge.net

Installation:
-------------

In order to install GetPot, simply copy the file 'GetPot.rb'
somewhere where your ruby interpreter can find it.

The 'file emacs-getpot-mode.el' contains some lines of
emacs-lisp code. If you append these lines to your .emacs
file, it will highlight your 'getpot' - input files.

Bug reports, feature requests:
------------------------------

Please, notify me in case there are any bugs or you think
that there should be more features in the library.
My email address is:

fschaef@users.sourceforge.net


Thanks for using this software.
Enjoy !

August 2001, 
Frank R. Schaefer


                                 ruby/examples/                                                                                      0000755 0001750 0001750 00000000000 13177706766 013461  5                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                ruby/examples/variables.rb                                                                          0000755 0001750 0001750 00000005171 13177705753 015760  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#
#    FILE: variables.rb
#
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
require 'GetPot'

# command line args
cl = GetPot.new(ARGV, $0)

# (1) search for multiple options with the same meaning
if cl.search("--help", "-h", "--hilfe", "--sos") or cl.size() == 1
  msg = "Example how to use GetPot to parse variables on the command line.\n",
    "USAGE:\n", 
    "--help, -h, --hilfe, --sos\n",
    "        get some help about this program.\n",
    "--internal-information, -i\n",
    "        show contents of database that was created by parser.\n",
    "\n",
    "type a command line like the following:\n",
    "variables.rb string=otto.von.bismarck float=3.14 \\\n",
    "             integer=41 vector='1.26 something 0x40'\n",
    "\n",
    "the variables that can be specified are:\n",
    "       float    a Float variable\n",
    "       integer  an Fixnum variable\n",
    "       string   a String variable\n",
    "       vector   a mixed type vector:\n",
    "                element 0 => Float \n",
    "                element 1 => String\n",
    "                element 2 => Fixnum\n"
  print msg
  exit(0)
end

if cl.search("--internal-information", "-i")
    cl.Print()
    exit(0)
end
        
# (2) some variables of each type
A_Number   = cl.call("float", 0.0)
An_Integer = cl.call("integer", 0)
A_String   = cl.call("string", "default")

Element1 = cl.call("vector", 0.0, 0)
Element2 = cl.call("vector", "default", 1)
Element3 = cl.call("vector", 0, 2)

print "Specified Parameters:\n"  
print "float   = %f " % A_Number   , "\n"
print "integer = %i " % An_Integer , "\n" 
print "string  = %s " % A_String   , "\n\n"

print "Vector elements:\n"  
print "Element 0 (double) = %f " % Element1 , "\n"
print "Element 1 (string) = %s " % Element2 , "\n"
print "Element 2 (int)    = %i " % Element3 , "\n" 

                                                                                                                                                                                                                                                                                                                                                                                                       ruby/examples/input-file.rb                                                                         0000755 0001750 0001750 00000006663 13177705753 016073  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#    FILE: input-file.rb
#
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
require 'GetPot'
cl    = GetPot.new(ARGV, $0)
ifpot = GetPot.new("example.pot")

if cl.search("--internal-information", "-i")
    ifpot.Print()
    exit(0)
end

# (1) search for multiple options with the same meaning
if cl.search("--help", "-h", "--hilfe", "--sos") or cl.search("--ok") == 0
  mesg = 
    "\nExample how to use GetPot to parse input files.\n\n",
    "USAGE:\n",
    "--ok\n",
    "        run the input file parsing.\n",
    "--help, -h, --hilfe, --sos\n",
    "        get some help about this program.\n\n",
    "--internal-information, -i\n",
    "        show contents of database that was created by file parser.\n\n",
    "--infile string\n",
    "        input file name (default: example.pot)\n"
  print mesg
  exit(0)
end

# (2) playing with sections
print "webpage    = %s" % ifpot.call("webpage", "nothing.somewhere.idn"), "\n"
print "user          = %s" % ifpot.call("user", "nobody"), "\n"
print "dos-file      = %s" % ifpot.call("dos-file", "nobody"), "\n"
print "latex-formula = %s" % ifpot.call("latex-formula", "nobody"), "\n"
print "no. clicks = %i" % ifpot.call("clicks", 0), "\n"
print "acceleration = %f" % ifpot.call("acceleration", 3.14), "\n"

print "vehicle/wheel-base = %f" % ifpot.call("vehicle/wheel-base",2.65), "\n"

x = ifpot.call("vehicle/initial-xyz", 0.0, 0)  # first element of vector
y = ifpot.call("vehicle/initial-xyz", 0.0, 1)  # second element of vector 
z = ifpot.call("vehicle/initial-xyz", 0.0, 2)  # third element of vector

print "vehicle/initial-xyz = %f, %f, %f" % [x, y, z] ,"\n"

print "vehicle/tires/B = %f" % ifpot.call("vehicle/tires/B", 976), "\n"
print "              C = %f" % ifpot.call("vehicle/tires/C", 5), "\n"
print "              E = %f" % ifpot.call("vehicle/tires/E", 5), "\n"
print "              D = %f" % ifpot.call("vehicle/tires/D", 22.404), "\n"

print "vehicle/chassis/Roh = %f" % ifpot.call("vehicle/chassis/Roh", 1.21), "\n"
print "                S   = %f" % ifpot.call("vehicle/chassis/S"  , 14.0), "\n"
print "                Cd  = %f" % ifpot.call("vehicle/chassis/Cd" , 0.45), "\n"

print "vehicle/chassis/doors/number = %i" % ifpot.call("vehicle/chassis/doors/number",2), "\n"
print "                      locks  = %s" % ifpot.call("vehicle/chassis/doors/locks","yes"), "\n"

# (3) playing with things we do normally only with command line arguments
n_f = ifpot.search("--nonsense", "-n", "--unsinn", "--sans-sense"), "\n"
print "x-ratio       = %f" % ifpot.follow(3.14, "vehicle/-x"), "\n"
print "sound-mode    = %s" % ifpot.nekst("none"), "\n"

print "nonsense-flag = ", n_f, "\n"


                                                                             ruby/examples/get.rb                                                                                0000755 0001750 0001750 00000002672 13177705753 014572  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#    FILE: get.rb Version 0.9
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
require 'GetPot'

cl = GetPot.new(ARGV, $0)

if cl.search("--help", "-h") == true
    print "Example to show how to use the get function.\n\n"
    print "Example:\n"
    print "    " + cl[0] + " 3.14 otto blah 0x43\n"
    exit(0)
end
    
A = cl.get(4, 256)    # integer version of get()
B = cl.get(1, 3.14)   # double version of get()
C = cl.get(2, "You")  # string version of get()

print "A (argument no 4) (integer) = ", A ,"\n"
print "B (argument no 1) (float)   = ", B ,"\n"
print "C (argument no 2) (string)  = ", C ,"\n"








                                                                      ruby/examples/filter.rb                                                                             0000755 0001750 0001750 00000007633 13177705753 015302  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
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
require 'GetPot'

cl    = GetPot.new(ARGV, $0)
ifpot = GetPot.new("example.pot")

# ifpot.Print()

# (1) search for multiple options with the same meaning
if cl.search("--help", "-h", "--hilfe", "--sos")
    msg = "Example program treating the prefix filtering.\n\n" \
          "   Using the function .set_prefix(section) only arguments, options \n" \
          "   variables are considered in the given 'section'\n\n" \
          "--help, -h, --hilfe, --sos \n" \
          "       this page.\n" \
          "--nice \n" \
          "       demonstrates how pseudo function calls can be accomplished.\n\n" \
          "please refer to the file 'example.pot' as input file.\n\n"          
    print msg          
    
    exit(0)
end        



#  -- note that the prefix is not considered as a flag
#  -- the index in 'argument contains' indicates the position
#    of the argument inside the namespace given by prefix
ifpot.set_prefix("group/")

print " -- flags in options / arguments\n"
first_f  = ifpot.argument_contains(1, "xX")
second_f = ifpot.argument_contains(1, "cCkK")
abc_f    = ifpot.options_contain("abc")
print "    Flags in first argument in [flags]\n\n"
print "    x or X in arg 1       = ", first_f,  "\n"
print "    c, C, k or K in arg 1 = ", second_f, "\n"
print "    a,b, or c in options  = ", abc_f,    "\n"
print "\n"
print " -- search(), nekst() and follow()\n"
print "\n"
print "    found \"--rudimental\" = ", ifpot.search("--rudimental"), "\n"
print "    followed by %i and %i\n" % [ifpot.nekst(-1), ifpot.nekst(-1)]
print "    rudimental = %s %i\n" % [ifpot.follow("nothing", "--rudimental"), ifpot.nekst(-1)]

# -- variables
print "\n"
print " -- variables in section [user-variables]"
print "\n"
ifpot.set_prefix("user-variables/")
for v in ifpot.get_variable_names()
  print "   ", v, "   \t= ", ifpot.call(v, 1e37, 0), "[", ifpot.call(v, "[1]", 1), "]\n"
end
print "\n"

if cl.search("--nice")
  print " -- pseudo function call feature\n"
  print "\n"

  ifpot.set_prefix("pseudo-function-calls/")

  # ifpot.Print()
  ifpot.init_multiple_occurrence()

  ifpot.search("LE-DEBUT")

  while 1 + 1 == 2
    nekst = ifpot.nekst("(no-func)")

    if nekst == "(no-func)" 
      break
    elsif nekst == "rectangle"
      size_x = ifpot.nekst(10)
      size_y = ifpot.nekst(10)
      print "\n"
      for y in 0 .. size_y - 1
	for x in 0 .. size_x- 3
	    print "*"
	end
	print "\n"
      end
    elsif nekst == "circle"
      radius = ifpot.nekst(4)
      print "\n"
      for y in 0 .. (radius*2)
	for x in 0 .. (radius*2)
	  if (x-radius)**2 + (y-radius)**2 <= radius**2 and \
	    (x-radius)**2 + (y-radius)**2 >= radius**2/4
	      print "."
	  else
	    print " "
	  end
	end
	print "\n"
      end
    elsif nekst == "smiley"
      mood = ifpot.nekst("happy")
      if   mood == "sad" 
	print ":( "
      else 
	print ":) "
      end
    elsif nekst == "new-line"
      no = ifpot.nekst(1)
      for i in 0 .. (no-1)
	print "\n"
      end
    end      
  end

else
  print "(use the --nice command line flag for graphical output)\n"
end

                                                                                                     ruby/examples/expand.rb                                                                             0000755 0001750 0001750 00000013757 13177705753 015300  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#
#    FILE: expand.rb 
#    (C) 2002  Frank R. Schaefer
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
require 'GetPot'

cl    = GetPot.new(ARGV, $0) # command line args
ifpot = GetPot.new("expand.pot")

if cl.search("--internal-information", "-i")
    ifpot.Print()
    exit(0)
end

# (*) help display
if cl.search("--help", "-h", "--hilfe", "--sos") or cl.search("--ok") == 0
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
    print msg
    exit(0)
end

# (*) example usage
print "[1.1]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "nobody")  

ifpot.set_prefix("1.2/")
print "[1.2]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")

ifpot.set_prefix("1.3/")
print "[1.3]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")

ifpot.set_prefix("1.4/")
print "[1.4]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")

ifpot.set_prefix("2.1/")
print "[2.1]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")
print "Information 2: %s\n" % ifpot.call("info2", "(nothing)")

ifpot.set_prefix("2.2/")
print "[2.2]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")

ifpot.set_prefix("2.3/")
print "[2.3]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")
print "Information 2: %s\n" % ifpot.call("info2", "(nothing)")

ifpot.set_prefix("3.1/")
print "[3]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")
print "Information 2: %s\n" % ifpot.call("info2", "(nothing)")
print "Information 3: %s\n" % ifpot.call("info3", "(nothing)")
print "Information 4: %s\n" % ifpot.call("info4", "(nothing)")
print "Information 5: %s\n" % ifpot.call("info5", "(nothing)")
print "Information 6: %s\n" % ifpot.call("info6", "(nothing)")
print "Information 7: %s\n" % ifpot.call("info7", "(nothing)")

ifpot.set_prefix("3.2/")
print "[3.2]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")

ifpot.set_prefix("3.3/")
print "[3.3]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")
print "Information 2: %s\n" % ifpot.call("info2", "(nothing)")
print "Information 3: %s\n" % ifpot.call("info3", "(nothing)")
print "Information 4: %s\n" % ifpot.call("info4", "(nothing)")
print "Information 5: %s\n" % ifpot.call("info5", "(nothing)")
print "Information 6: %s\n" % ifpot.call("info6", "(nothing)")
print "Information 7: %s\n" % ifpot.call("info7", "(nothing)")

ifpot.set_prefix("3.4/")
print "[3.4]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")
print "Information 2: %s\n" % ifpot.call("info2", "(nothing)")

ifpot.set_prefix("3.5/")
print "[3.5]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")
print "Information 2: %s\n" % ifpot.call("info2", "(nothing)")
print "Information 3: %s\n" % ifpot.call("info3", "(nothing)")
print "Information 4: %s\n" % ifpot.call("info4", "(nothing)")
print "Information 5: %s\n" % ifpot.call("info5", "(nothing)")
print "Information 6: %s\n" % ifpot.call("info6", "(nothing)")
print "Information 7: %s\n" % ifpot.call("info7", "(nothing)")

ifpot.set_prefix("3.6/")
print "[3.6]--------------------------------------------------------------------------\n"
print "Information 0: %s\n" % ifpot.call("info0", "(nothing)")
print "Information 1: %s\n" % ifpot.call("info1", "(nothing)")

                 ruby/examples/nekst.rb                                                                              0000755 0001750 0001750 00000003374 13177705753 015137  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#
#    FILE: nekst.rb
#
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
require 'GetPot'

cl = GetPot.new(ARGV, $0)

if cl.size() == 1 or cl.search("--help", "-h")
    print "\nExample to use next()-functions:\n"
    print "USAGE:\n"  
    print "    $1  (double) Value of A\n"  
    print "    $2  (integer) Value of B\n"  
    print "    $3  (string) Name to be printed\n"  
    print "    $4  (integer) Some number to be printed\n"  
    exit(0)
end

# read arguments one by one on the command line
#  (lazy command line parsing)
# note that 'next' is a keyword in ruby the member function
# had to be renamed close to the standard 'next()' -> 'nekst()'
cl.reset_cursor()
A = cl.nekst(0.0)   # [rad]
B = cl.nekst(256)   # [1/s]
User = cl.nekst("You")
No   = cl.nekst(0x42) 

print "\n"
print "A = %f" % A , "\n"
print "B = %i" % B , "\n"
print "Name           = %s" % User ,"\n"
print "Special number = %i" % No  , "\n"
print "\n"



                                                                                                                                                                                                                                                                    ruby/examples/example.pot                                                                           0000755 0001750 0001750 00000005622 13177706641 015640  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                # -*- getpot -*- GetPot mode activation for emacs
#
# Example input file to be parsed by 'GetPot'
#
# (C) 2001 Frank R. Schaefer
# License Terms: MIT
############################################################################

# (*) --------------------------------------------------------------------------
#     examples dealing with input file parsing (input-file.py/.cpp/.java etc.)
#-------------------------------------------------------------------------------
clicks       = 231   # [1/s]
acceleration = 1.231 # [m/s^2]

[vehicle]
wheel-base  = 2.65            # [m]
initial-xyz = '100. 0.1  5.0' # [m]


   [./tires]     # i.e. vehicle/tires/ 
   # Coefficients for Pacejka's Magic Formula 
   # Reference: Bakker, Nyborg, Pacejka: 
   #            "Modelling for Use in Vehicle Dynamics Studies", 
   #             SAE Technical Paper Series 870421, 1988
   B = 3.7976    # [1]
   C = 1.25      # [1]
   E = -0.5      # [1]
   D = 64322.404 # [N]  

   [../chassis]  # i.e. vehicle/chassis/
   Roh = 1.21    # [kg/m^3] density of air 
   S   = 5.14    # [m^2]    reference surface
   Cd  = 0.45    # [1]      air drag coefficient

      [./doors]  # i.e. vehicle/chassis/doors/
      number = 777
      locks  = 'in place'

# back to the root name space
[] 
webpage = http://getpot.sourceforge.net/index.html

# some words about quotes and backslashes
# (1) whitespace requires quotes
user     = 'Alfons Haeberle'
# (2) backslashed quote => quote  
latex-formula = '\\kappa\' = \\frac{d}{d s} \\kappa' 
# (3) double backslash in quotes = backslash
dos-file = 'C:\\Program Files\\Applications'

# (*) --------------------------------------------------------------------------
#     examples using the prefix filter (filter.py/.cpp/.java etc.)
#-------------------------------------------------------------------------------
[group]
# playing with pseudo command line arguments:
#   note that 
#               '-x', '3134' and '--rudimental' 
#   will be known as 
#               'flags/-x', 'flags/3234' and 'flags/rudimental'.
#
#   Therefore 3134, for example, is **NOT** a number as long,
#   as no prefix filter "flags/" is set.
-x 3134 
--rudimental 12 777

[other]
# this section will be skipped by the 'next' function when the prefix
# is set
nonsense


[user-variables]
# This section contains variables that the user defined himself.
# The GetPot interpreter uses 'get_variable_names()' in order to
# get to know their names.
preview-coefficient   = '12 cm'
lateral-side-distance = '2.1 m/s' 
control-interval      = '0.1 s'
compensation-ratio    = '0.4e34 rad/(m*s)'

[pseudo-function-calls]
# The following code shows how GetPot can be used to emulate
# trivial function calls. Please, note that no syntax checking
# can be provided by this method.
LE-DEBUT
smiley sad
new-line 1
# draw rectangle width = 40, height = 10
rectangle 40 10
new-line 1
smiley happy
# draw circle radius = 15
circle 15
new-line 1
smiley happy
new-line 2
LA-FIN

                                                                                                              ruby/examples/expand.pot                                                                            0000644 0001750 0001750 00000023026 13177705753 015462  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                # -*- getpot -*- GetPot mode activation for emacs
#
# Example input file to be parsed by 'GetPot':
#-------------------------------------------------------------------------------
# PURPOSE:
#   Demonstration of the abilities of the $-Bracket Language in GetPot.
#
#
# (*) STRING OPERATORS:
#
#   ${string}  variable replacement (possibly recursive):
#         replace ${}-expression by content of variable named 'string'.
#
#   ${:string} pure strings:
#         replace ${}-expression by the string 'string' itself (including 
#	  whitespace). This becomes important in combination with macro 
#         expansion. It allows ${}-expressions inside strings without 
#         being parsed directly.
#
#   ${& string1 string2 string3 ... } concatination:
#         concatinate 'string1', 'string2', 'string3', etc. to one single 
#         string whithout any kind of whitespace in between.
#
#   ${<-> string orginal replacement} replacement:
#         replace all occurences of 'original' in 'string' with 'replacement'
#
# (*) ARITHMETIC OPERATORS:
#
#   ${+ arg1 arg2 arg3 ...} plus:
# 	replace ${}-expression by the sum: 'arg1' + 'arg2' + 'arg3' + ...
#
#   ${* arg1 arg2 arg3 ...} multiplication:
# 	replace ${}-expression by the product: 'arg1' * 'arg2' * 'arg3' * ...
#
#   ${- arg1 arg2 arg3 ...} substraction:
# 	replace ${}-expression by: 'arg1' - 'arg2' - 'arg3' - ...
#
#   ${/ arg1 arg2 arg3 ...} division:
# 	replace ${}-expression by: 'arg1' / 'arg2' / 'arg3' / ...
#
# (*) COMPARISON OPERATORS:
#
#   ${== arg0 arg1 arg2 ...} equal:
# 	returns the number of the first argument starting with '1' for 'arg1'  
# 	that is equal to 'arg0'.
# 	returns '0' in case none is equal.
#   ${> arg0 arg1 arg2 ...} greater:
#   ${< arg0 arg1 arg2 ...} less:
#   ${>= arg0 arg1 arg2 ...} greater or equal:
#   ${<= arg0 arg1 arg2 ...} less or equal:
#       	analogous to ${== }-operator.
#
# (*) CONDITIONAL EXPANSION:
#
#   ${? arg0 if-string else-string} if-then statement:
#         return 'if-string' in case arg0 == 1 and 'else-string' else.
#
#   ${?? arg0 string1 string 2 string3 ...} choice.
#         return string0 if arg1 == 1, string1 if arg1 == 2, etc.
#
# (*) VECTOR/STRING SUBSCRIPTION:
#
#   ${@: string index} letter:	
# 	return letter number 'index' in 'string'.
#
#   ${@: string index1 index2} substrings:
# 	return substring in 'string' from 'index1' to 'index2'
#
#   ${@ variable index} vector element:
# 	return element number 'index' in 'variable'	
#
#   ${@ variable index1 index2} sub-vector:
# 	return sub-vector in 'variable' from element 'index1' to 
# 	element 'index2'.
#
# (*) MAKRO EXPANSION:
#
#   ${! variable} expand:
# 	replacement ${}-expression by the evaluation of the content of 'variable'.
#         The variable should be defined with a pure string (${: }) so that expressions
# 	inside it are not parsed during the assignment.
#
# (C) 2002 Frank R. Schaefer
# License Terms: GNU GPL
################################################################################

#-------------------------------------------------------------------------------
# (1) variable replacement -----------------------------------------------------
#-------------------------------------------------------------------------------
name = GetPot

[${name}] # meaning: [GetPot]
address = getpot.sourceforge.net
[]
info0 = ${GetPot/address}

[1.2] # advanced variable replacement ------------------------------------------
[Philosophy]
   boss       = 'Dr. Frederique Mouillard'
   members    = 4
   professors = 3
[Mechanical-Engineering]
   boss       = Dr.\ Frieda\ LaBlonde
   members    = 24
   professors = 5

[]
x1 = Mechanical-Engineering
x2 = Philosophy
[1.2]
info0 = '${${x1}/boss}: ${${x1}/professors}/${${x1}/members}'
info1 = '${${x2}/boss}: ${${x2}/professors}/${${x2}/members}'


[1.3] # recursive replacements -------------------------------------------------
#      1.3.1 simple replacements
car            = Citroen-2CV
ground-vehicle = car
vehicle        = ground-vehicle
object         = vehicle
# ${object}         --> vehicle
# ${vehicle}        --> ground-vehicle
# ${ground-vehicle} --> car
# ${car}            --> Citroen-2CV

# note that even variable names can be composed of ${ } expressions
variable = info0
${variable} = '${${ ${ ${object}}}}'

#      1.3.2 conglomerate variable names
[Citroen-2CV]
	[./wheels]
		[./front]
			[./right]
			radius = 30 # [cm]

[1.3]
part      = wheels
attribute = radius
position  = front/right

variable  = info1
${variable} = '${${${${${object}}}}/${part}/${position}/${attribute}}'

[1.4] # dictionaries -----------------------------------------------------------

[Nicknames]
	BMW         = Beamer
	Mercedez    = Grandpa\'s\ Slide
	Volkswagen  = Beetle
        Citroen-2CV = Deuche
[1.4]
info0 = '${Nicknames/${1.3/info0}}'
my-car = Mercedez
info1 = '${Nicknames/${1.4/my-car}}'

#-------------------------------------------------------------------------------
# (2) string expressions -------------------------------------------------------
#-------------------------------------------------------------------------------
[2.1] # pure strings -----------------------------------------------------------
info0 = ${:even expressions like ${my-car} are left as they are}
info1 = ${:\\-ing (backslashing) works still the same way}
info2 = ${:backslashes allow one to have spaces w/o quotes}

[2.2] # concatination ----------------------------------------------------------
info0  = ${& simple concatination without whitespaces results in a mess}
info1 =  '${& ${:In France, the } ${1.3/info0} 
          ${: is called \'La } ${Nicknames/${1.3/info0}} \'}
         '

[2.3] # replacement ------------------------------------------------------------
info0 = 'We spell your name \'${<-> Phillip Ph F}\''
info1 = 'The ${<-> ${Nicknames/Volkswagen} ee ea}s'
car = Nicknames/Citroen-2CV
info2 = 'I switched from ${${car}} to ${${<-> ${car} Citroen-2CV Volkswagen}}'

#-------------------------------------------------------------------------------
# (3) numeric expressions ------------------------------------------------------
#-------------------------------------------------------------------------------
[3.1] # basics -----------------------------------------------------------------
info0 = ${+ 1 1}
x = 4699 y = 14 z = 4
# don't forget to glue the minus sign to negative numbers
info1 = ${+ ${x} ${y} -2}

info2 = ${- 10 1}
info3 = ${- ${x} ${y} -2}

info4 = '${* 12 12}'
info5 = '${* 2 2 ${z}}'

info6 = '${/ 12 6}'
info7 = '${/ 144 12 3 2}'

[3.2] # power expressions ------------------------------------------------------
info0 = '${^ 2 16}'
info1 = '${^ 2 2 2 2}'  # ((2^2 = 4)^2 = 16)^2 = 256


[3.3] # comparisons ------------------------------------------------------------
info0 = ${== 1 2}
info1 = ${== Deuche ${${2.3/car}}}
info2 = ${== 1.0 1.000}
info3 = '${>= 3.14 12} but ${>= 3.14 0.0} and ${>= 3.14 3.140000}'
info4 = '${< 12 3.14} but ${< 3.14 3.141} and ${> Berta Vladimir}'
info5 = '${> 12 3.14} but ${> 3.14 3.141} and ${> Zeppelin Alberta}'

# which one is right ? ---------------------------------------------------------
# comparison operator return number of first matching in list
info6 = 'The real name for 'Deuche' is number ${== Deuche
				                   ${Nicknames/Volkswagen}
	   	                                   ${Nicknames/Mercedez}
	                                           ${Nicknames/Citroen-2CV}
		                                   ${Nicknames/BMW}}'

info7 = 'The first element less than 2 is element number ${> 2 10 1001 3 6 1 9 -10}'

[3.4] # conditions -------------------------------------------------------------
guess = Citroen-2CV
info0 = 'Your guess was ${? ${== Citroen-2CV ${guess}} right wrong}'
x = 12 y = 14
info1 = 'x (=${x}) is ${?${> ${x} ${y}} greater less} than y (=${y})'
[msg]
english   = 'Star Wars'
francais  = 'La Guerre des Etoiles'
espagnol  = 'Las Guerras De la Estrella'
italiano  = 'Le Guerre Della Stella'
deutsch   = 'Krieg der Beruehmten'
portugues = 'As Guerras Da Estrela'

[3.4] # choices 
domain = .fr
info2 = '${?? ${== ${domain} .de .uk .fr .es .it .pt} 
              ${msg/deutsch}
              ${msg/english}
              ${msg/francais}
              ${msg/espagnol}
              ${msg/italiano}
              ${msg/portugues}}'

[3.5] # vector/string subscription ---------------------------------------------
#       (note, that '-1' stands for end of array)
# string subscription ${@:
info0 = '${@: Wasserkraftwerkinstallationsunternehmenspruefstelle 6 10}'
info1 = '${@: Wasserkraftwerkinstallationsunternehmenspruefstelle 4}'
info2 = '${@: Wasserkraftwerkinstallationsunternehmenspruefstelle 40 -1}'
info3 = '${@: Wasserkraftwerkinstallationsunternehmenspruefstelle 0 5}'

my-vector = 'Cordoba Madrid Buenos-Aires Kairo Moskow Heidelberg 
	     Grenoble Marseille Disneyland'

# vector subscription ${@:
info4 = ${@ my-vector  4  -1} # element 4 until end
info5 = ${@ info4  3  4}      # element 3 and 4
info6 = ${@ info4  0  3}      # element 0 until 3 (3 included)
info7 = ${@ info4  4}         # element 4


[3.6] # macro evalutation ------------------------------------------------------
# Note that the accuracy is horrible :-) !
# approximation of a sinus (defined as a pure string):
#     sin(x) = x -1/6 x^3 + 1/120 x^5 -1/5400 x^7 .... 
x2  = ${: ${* ${x} ${x}}}
x4  = ${: ${* ${!x2} ${!x2}}}
x6  = ${: ${* ${!x4} ${!x2}}}
sin = ${: ${* ${x} 
	       ${+ 1       
                   ${/ ${!x2} -6}  
                   ${/ ${!x4} 120}   
                   ${/ ${!x6} -5040}
               }	    
           }
       }

convert = ${/ 3.14 180.0}  # [degree] -> [rad]

x = ${* 30 ${convert}}   
info0 = ${!sin}

x = ${* 60 ${convert}}   
info1 = ${!sin}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ruby/examples/nominus.rb                                                                            0000755 0001750 0001750 00000003172 13177705753 015477  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#
#    FILE: nominus.rb
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
require 'GetPot'

cl = GetPot.new { ARGV }      # command line args

if cl.size() == 1 or cl.search("--help", "-h")
    print "\nExample to use nominus arguments:\n"  
    print "USAGE:\n"  
    print "--help, -h  get some help about this program.\n\n"  
    print "any option that does not start with '-'\n"  
    print "will be printed on screen twice.\n\n"  
    exit(0)
end
    
print "no. of nominus arguments = ", cl.nominus_size(), "\n"

# print out all argument that do not start with a minus
nm = cl.next_nominus()     

while nm != ''
    print "[", nm , "]\t"
    nm = cl.next_nominus()     
end
print "\n"

# now get the whole vector at once
files = cl.nominus_vector()
files.each{ | file |
  print "<", file, ">"
}





                                                                                                                                                                                                                                                                                                                                                                                                      ruby/examples/flags.rb                                                                              0000755 0001750 0001750 00000003605 13177705753 015104  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#    FILE: flags.rb
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
require 'GetPot'

cl = GetPot.new(ARGV, $0)

if cl.size() == 1 or cl.search("--help", "-h")
    print "Example application using flags:\n"
    print "USAGE:\n" 
    print "--help, -h  get some help about this program.\n\n" 
    print "The first argument will be checked if it contains 'x' or 'X'.\n" 
    print "If so the first flag will be set. The second flag will be set if\n" 
    print "the first argument contains a 'c', 'C', 'k', or a 'K'.\n\n" 
    print "The 'abc' flag is set when any argument starting with '-' contains an\n" 
    print "'a', 'b' or a 'c'.\n\n" 
    exit(0)
end

# does first argument contain 'x', 'X', 'c', 'C', 'k', or  'K' ?
first_f  = cl.argument_contains(1, "xX")
second_f = cl.argument_contains(1, "cCkK")

# is there any option starting with '-' containing 'a', 'b', or 'c' ?
abc_f = cl.options_contain("abc")

print "first flag       = (boolean) ", first_f,"\n"
print "second flag      = (boolean) ", second_f,"\n" 
print "a, b, or c found = (boolean) ", abc_f,"\n" 



                                                                                                                           ruby/examples/ufo.rb                                                                                0000755 0001750 0001750 00000014650 13177705753 014603  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#     FILE: ufo.rb
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
require 'GetPot'

def print_help()
  print "USAGE:  ufo.rb [--help] [--arguments] [--options] [--flags] [--sections]\n"
  print "               [--variables] [--nominuses [-i file] [-o filename]]\n"
  print "               ... any arguments\n"
  print "\n"
  print "PURPOSE: \n"
  print "        Testing the GetPot's ability to detect unknown flying objects\n"
  print "         (i.e. un-recognized command line arguments. The type of flying\n"
  print "        object you want to check for is specified through one of the\n"
  print "        following options:\n"
  print "\n"
  print "        --arguments\n"
  print "             test all arguments against an internal list of possible arguments.\n"
  print "\n"
  print "        --options\n"
  print "             test all options (arguments starting with at least one '-') against\n"
  print "             an internal list of options.\n"
  print "\n"
  print "        --flags\n"
  print "             test first argument and all options against internal list of flags\n"
  print "             (i.e. letters in arguments that act as switches)\n"
  print "\n"
  print "        --sections\n"
  print "             reads the input file 'example.pot' for sections that are\n"
  print "              unidentified. add some sections yourself to test this feature.\n"
  print "\n"
  print "        --variables\n"
  print "             tests all variables specified on the command line against a list\n"
  print "             of specified variables.\n"
  print "\n"
  print "        --nominuses\n"
  print "             check for unrecognized nominuses. filenames after -i and -o are\n"
  print "             recognized.\n"
  print "\n"
  print "        Once you specified your mode add any number of command line\n"
  print "        arguments and watch the output.\n"
  print "\n"
  print "EXAMPLES:\n" 
  print "        > ./ufo.rb yes no -i source.cpp --arguments\n" 
  print "\n" 
  print "        > ./ufo.rb -i source.cpp --force n=13 -xzt --options\n" 
  print "\n" 
  print "        > ./ufo.rb zfd if=source.cpp force n=13 -l -zrt -olp --flags\n" 
  print "\n" 
  print "        > ./ufo.rb zfd x=12 y=234 loength=21 height=21 n=2 --variables\n" 
  print "\n" 
  print "        > ./ufo.rb --sections # (edit file section labels in example.pot)\n" 
  print "\n" 
  print "        > ./ufo.rb n=21 -i in.dat -o out.dat /etc/fstab force --nominuses \n" 
  print "\n" 
  print "AUTHOR: (C) 2002 Frank R. Schaefer\n";
end

cl = GetPot.new(ARGV, $0)

if cl.search("-h", "--help")
    print_help()
    exit(0)

elsif cl.search("--arguments")
    #  (*) unidentified flying arguments ---------------------------------------------
    ufos = cl.unidentified_arguments("--arguments", "-h", "--help", "yes", "no")
    print "Unidentified Arguments (other than '--arguments', '-h', '--help', 'yes', 'no'):\n"

elsif cl.search("--options")
    #  (*) unidentified flying options (starting with '-' or '--') -------------------
    ufos = cl.unidentified_options("--options",  "-h", "--help",
                                   "yes(ignored anyway)", "no(ignored anyway)")
    print "Unidentified Options (different from '--options',  '-h', '--help'):\n"

elsif cl.search("--flags")
    #  (*) unidentified flying flags -------------------------------------------------

    #  -- flags in the first argument
    ufos = cl.unidentified_flags("xzfjct", 1)
    print "-- Unaccepted flags in argument 1:\n\n"
    for flag in 0 .. ufos.size
        print "      '%s'\n" % [ ufos[flag .. flag] ]
    end
    print "   Accepted flags: 'x' 'z' 'f' 'j' 'c' 't'\n\n"

    #  -- flags in arguments starting with a single '-'
    ufos = cl.unidentified_flags("ltrm")
    print "-- Unaccepted flags in options (argument with one '-'):\n"
    for flag in 1 .. ufos.size
        print "      '%s'\n" % [ ufos[flag .. flag] ]
    end
    print "   Accepted flags in options: 'l' 't' 'r' 'm'\n"
    exit(0)
    
elsif cl.search("--variables")
    #  (*) unidentified flying variables ---------------------------------------------
    ufos = cl.unidentified_variables("x", "y", "z", "length", "height")
    
    print "Unidentified Variables (other than 'x', 'y', 'z', 'length', 'height'):\n"

elsif cl.search("--sections")
    #  (*) unidentified flying sections ----------------------------------------------
    ifile = GetPot.new("example.pot")
    ufos = ifile.unidentified_sections("vehicle/", 
                                       "vehicle/tires/", 
                                       "vehicle/chassis/",
                                       "vehicle/chassis/doors/",
                                       "group/",
                                       "other/",
                                       "user-variables/",
                                       "pseudo-function-calls/")
    
    print "Unidentified sections in file 'example.pot':\n"
    if ufos.size == 0
      print "    (none) add [..] section labels in file 'example.pot'.\n"
    end

elsif cl.search("--nominuses")
    #  (*) unidentified flying options (starting with '-' or '--') -------------------
    tmp = []
    #  -- read two filenames for demonstration purposes
    infile = cl.follow("default-in.znf", "-i")
    outfile = cl.follow("default-out.znf", "-o")    
    tmp << infile
    tmp << outfile
    
    #  -- get any other nominuses not used until now
    ufos = cl.unidentified_nominuses(tmp)

    print "Unused Nominus Arguments (other than arguments after -i and -o):\n"
else
    print_help()
    exit(0)
end

# (*) print out unidentified flying objects
for ufo in ufos
    print "     " + ufo + "\n"
end
                                                                                        ruby/examples/GetPot.rb                                                                             0000777 0001750 0001750 00000000000 13177705753 017142  2../GetPot.rb                                                                                        ustar   fschaef                         fschaef                                                                                                                                                                                                                ruby/examples/options.rb                                                                            0000755 0001750 0001750 00000003627 13177705753 015507  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#    FILE: options.rb
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

require 'GetPot'

cl = GetPot.new(ARGV, $0)

# (1) search for a single option
# -------------------------------
#     check if the '--do-nothing' flag is set and exit if yes
 exit(0) if cl.search("--do-nothing")

# (2) search for multiple options with the same meaning
if cl.size() == 1 or cl.search("--help", "-h", "--hilfe", "--sos")
    print "\nExample to show how to use search()-functions:\n\n"
    print "USAGE:\n"  
    print "--do-nothing   quit without doing anything.\n"
    print "--nice         write a nice phrase on the terminal.\n"  
    print "--help, -h, --hilfe, --sos\n"  
    print "               get some help about this program.\n"  
    print "--beep, -b, --piepse, --bip, --senal-acustica\n"  
    print "               get your system to make a beep.\n"  
    exit(0)
end

print "\a" if cl.search("--beep", "--piepse", "--bip", "--senal-acustica", "-b")

print "Program terminated.\n"

# (3) does the user want us to be nice ... ?
print "Have a nice day.\n" if cl.search("--nice")
   









                                                                                                         ruby/examples/direct_follow.rb                                                                      0000755 0001750 0001750 00000004502 13177705753 016641  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#    FILE: direct_follow.rb
#
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
require 'GetPot'

cl = GetPot.new(ARGV, $0)

if cl.size() == 1 or cl.search("--help", "-h")
    print "\nExample to use direct_follow()-functions:\n\n"
    print "USAGE:\n"
    print "--help, -h  get some help about this program.\n\n"
    print "-Ustring    specify user name as string\n" 
    print "-Vx         specify a value given as x\n"
    print "-NUMx       specify number given as x\n\n"
    print "a total amount of three of each is expected.\n"
    exit(0)
end

# Specify, that in case the cursor reaches the end of argument list,
# it is not automatically reset to the start. This way the search
# functions do not wrap around. Instead, they notify an 'not fount'
# in case the option was not in between 'cursor' and the argv.end().
cl.reset_cursor()
cl.disable_loop()

# check out 'const char*' versions
users = []
users.push(cl.direct_follow("Otto", "-U"))
users.push(cl.direct_follow("Karl", "-U"))
users.push(cl.direct_follow("Friedrich", "-U")) 


# check out 'Float' versions
cl.reset_cursor();
values = []
values.push(cl.direct_follow(3.14, "-V"))
values.push(cl.direct_follow(9.81, "-V"))
values.push(cl.direct_follow(1.16, "-V"))

# check out 'Fixnum' versions
cl.reset_cursor();
numbers = []
numbers.push(cl.direct_follow(10, "-NUM"))
numbers.push(cl.direct_follow(11, "-NUM"))
numbers.push(cl.direct_follow(12, "-NUM"))

for i in 0 .. 2
    print "%s: \tV=%f \tNumber=%i" % [users[i], values[i], numbers[i]], "\n"
end
                                                                                                                                                                                              ruby/examples/follow.rb                                                                             0000755 0001750 0001750 00000004571 13177705753 015315  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #! /usr/bin/env ruby
#    FILE: follow.rb
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
require 'GetPot'

cl = GetPot.new(ARGV, $0)

if cl.size() == 1 or cl.search("--help", "-h", "--hilfe", "?")
    print "\nExample to use follow()-functions:\n\n" 
    print "USAGE:\n"  
    print "--help, -h, --hilfe, ?\n"  
    print "       get some help about this program.\n"  
    print "--alpha number\n"  
    print "       specify the value of alpha given as number.\n"  
    print "--beta number\n"  
    print "       specify the value of beta given as number.\n"  
    print "--user, -u string number\n"  
    print "       specify user name as string and id as number\n"  
    print "       (default = 'You' and '0x42').\n"  
    print "       multiple users possible.\n"  
    print "--size, --sz, -s number1 number2\n"  
    print "       specify x and y sizes\n"  
    exit(0)
end

# read arguments one by one on the command line
#  (lazy command line parsing)

Alpha = cl.follow(0.0, "--alpha") # [rad]
Beta  = cl.follow(256, "--beta")  # [1/s]

cl.init_multiple_occurrence()
User  = cl.follow("You", "--user", "-u")      
No    = cl.nekst(0x42) 
User2 = cl.follow("You Two", "--user", "-u") # second user specified ?
No2   = cl.nekst(0x43) 

cl.enable_loop()
XSz = cl.follow(0.0, "--size", "--sz", "-s") # [cm]
YSz = cl.nekst(0.0)                          # [cm]

print "\n"
print "Alpha = %f\n" % Alpha
print "Beta  = %i\n" % Beta
print "Names = ", User, " and ", User2, "\n"
print "Special numbers = %i and %i\n" % [No, No2]
print "x-size, y-size = (%f, %f)\n" % [XSz, YSz]
print "\n"


                                                                                                                                       ruby/GetPot.rb                                                                                      0000755 0001750 0001750 00000104542 13177705753 013376  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                #  -*- ruby -*- 
#  GetPot Version 1.0                                        Sept/13/2002
#  
#  WEBSITE: http://getpot.sourceforge.net
#  
#  This library is  free software; you can redistribute  it and/or modify
#  it  under  the terms  of  the GNU  Lesser  General  Public License  as
#  published by the  Free Software Foundation; either version  2.1 of the
#  License, or (at your option) any later version.
#  
#  This library  is distributed in the  hope that it will  be useful, but
#  WITHOUT   ANY  WARRANTY;   without  even   the  implied   warranty  of
#  MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See  the GNU
#  Lesser General Public License for more details.
#  
#  You  should have  received a  copy of  the GNU  Lesser  General Public
#  License along  with this library; if  not, write to  the Free Software
#  Foundation, Inc.,  59 Temple Place,  Suite 330, Boston,  MA 02111-1307
#  USA
#  
#  (C) 2001 Frank R. Schaefer  
#==========================================================================
class GetPot_variable
    attr_accessor  :name     # name of the variable/vector
    attr_accessor  :original # original string that contains the variable
    attr           :value    # split up values of the vector

    def initialize(name_, string_)
        @name = name_
        take(string_)
    end

    def take(string_)
        @original = string_
        @value = @original.split()
    end
end

class GetPot
    #----------
    # command line and input file parser
    #-----------------------------------
    def initialize(*args)
        @prefix = ""
        @section = ""
        # interpret the array of arguments
        no_args = args.size()

        if no_args >= 1
            if args[0].type == Array
                if no_args >= 2 and args[1].type == String
                    # argv [0] application name [1]
                    argv = [ args[1] ] 
                else
                    # no application name
                    argv = [ "(application)" ] 
                end
                # args[0] -> argument vector
                argv.concat(args[0])
            elsif args[0].type == String
                argv = [ args[0] ]
                argv.concat(read_in_file(args[0]))
            end
        else
            argv = [ "(application) " ]
        end

        # in case a search for a specific argument failed,
        # it effects the next functions block.
        @search_failed_f = false

        # indeces of arguments that do not start with minus
        @idx_nominus = []

        # vector of identified variables
        # (arguments of the form "variable=value")
        @variables = []

        # cursor oriented functions (nect(), follow(), etc.): 
        # pointer to actual position to be parsed.
        @cursor = 0
        @nominus_cursor = -1
        @search_loop_f = true

        # set up the internal database
        @argv = __parse_argument_vector(argv)
    end

    def __parse_argument_vector(argv_)
        return [] if argv_ == nil

        @section = ''
        @section_list = []
        section_stack = []
        argv = []

        for i in 0 .. argv_.size()-1
            arg = argv_[i]

            if arg.size() == 0 
                next
            elsif i == 0
                argv.push(arg); next
            end

            if arg.size() > 1 and arg[0] == ?[ and arg[-1] == ?]
                name = DBE_expand_string(arg[1 .. arg.size()-2])
                @section = process_section_label(name, section_stack)
                @section_list << @section
                argv.push(arg)	
            else
                arg = @section + DBE_expand_string(arg)
                argv.push(arg)
            end

            if arg[0] != ?- and i != 0
                @idx_nominus += [ i ]
            end

            for i in 0 .. arg.size() - 1
                if arg[i] == ?=
                    v = __find_variable(arg[0 .. i-1])
                    if v == ''
                        nv = GetPot_variable.new(arg[0 .. i-1], arg[i+1 .. arg.size()-1])
                        @variables.push(nv)
                    else
                        v.take(arg[i+1 .. arg.size()-1])
                    end
                end
            end

        end

        return argv
    end

    def read_in_file(filename)
        begin    
            fh = File.new(filename, "r")
        rescue
            return ['']
        end
        brute_tokens = []
        token = 0

        while token != ''
            __skip_whitespace(fh)
            token = __get_next_token(fh)
            brute_tokens.push(token)
        end

        # -- reduce expressions of token1'='token2 to a single 
        #    string 'token1=token2'
        # -- copy everything into 'argv'
        # -- arguments preceded by something like '[' name ']' (section)
        #    produce a second copy of each argument with a prefix '[name]argument'
        i1 = 0; i2 = 1; i3 = 2;

        # loop over brute tokens to create argv vector
        argv= []
        while i1 < brute_tokens.size()
            # 1) detect sections '[name]'
            sRef = brute_tokens[i1];

            if i2 < brute_tokens.size() and brute_tokens[i2] == "="
                # 2) concatinate 'abcdef' '=' 'ghijklmno' to 'abcdef=ghijklmno'
                if i3 >= brute_tokens.size()
                    argv.push(brute_tokens[i1] + brute_tokens[i2])
                else
                    argv.push(brute_tokens[i1] + brute_tokens[i2] + brute_tokens[i3])
                    i1 = i3 + 1; i2 = i3 + 2; i3 = i3 + 3;
                    next
                end
            else
                argv.push(sRef)
                i1 = i2; i2 = i3; i3 += 1
            end
        end
        return argv
    end

    def __skip_whitespace(fH)
        # Skips whitespaces: space, tabulator, newline and #-comments.
        tmp = ?\s
        while 1+1==2
            while tmp == ?\s or tmp == ?\t or tmp == ?\n
                tmp = fH.getc()
                # end of file ?
                return if tmp == nil
            end
            # found a non whitespace 
            if tmp != ?#
                # put the last read letter back
                fH.ungetc(tmp) 	# -1 backwards from current position
                return
            end

            # '#' - comment => skip until end of line
            str = ""
            while tmp != ?\n
                str << tmp; tmp = fH.getc()
                return if tmp == nil
            end
        end
    end

    def __get_next_token(fH)
        # Reads next chunk of characters that are not separated by
        # whitespace. Quotes, however, allow to embrace whitespaces.
        token = ''; tmp = 0
        while 1+1 == 2
            last_letter = tmp; tmp = fH.getc()

            if tmp == nil or (tmp == ?\s or tmp == ?\t or tmp == ?\n) and not last_letter == ?\\
                return token

            elsif tmp == ?\' and not last_letter == ?\\
                # QUOTES: un-backslashed quotes => it's a string
                token += __get_string(fH)
                next	
            elsif tmp == ?{ and last_letter == ?$
                token += '{' + __get_until_closing_bracket(fH)
                next
            elsif tmp == ?$ and last_letter == ?\\
                token << tmp; tmp = 0 # so that last_letter will become = 0, not '$'
                next
            elsif tmp == ?\\ and not last_letter == ?\\
                next                  # don't append un-backslashed backslashes
            end

            token << tmp      
        end
    end

    def __get_string(fH)
        # Reads characters until the next un-backslashed quote.
        str = ''; tmp = 0
        while 1 + 1 == 2
            last_letter = tmp; tmp = fH.getc()
            if tmp == nil
                return str	
                # un-backslashed quotes => it's the end of the string
            elsif tmp == ?\' and not last_letter == ?\\
                return str
            elsif tmp == ?\\ and not last_letter == ?\\  # don't append 
                next
            end
            str << tmp
        end
    end

    def __get_until_closing_bracket(fH)
        str = ''; tmp = 0
        brackets = 1
        while 1 + 1 == 2
            last_letter = tmp; tmp = fH.getc()
            if tmp == nil
                return str            
            elsif tmp == ?{ and last_letter == ?$
                brackets += 1
            elsif tmp == ?}
                brackets -= 1
                # un-backslashed brackets => it's the end of the string
                if brackets == 0 
                    return str + '}'
                end
            elsif tmp == ?\\ and not last_letter == ?\\
                next  # do not append an unbackslashed backslash
            end
            str << tmp
        end
    end

    def process_section_label(label, section_stack)
        #  1) subsection of actual section ('./' prefix)
        if label.size() >= 2 and label[0 .. 1] == "./"
            label = label[2 .. label.size()-1]
            # a single [./] means 'the same section'                    
            #  2) subsection of parent section ('../' prefix)
        elsif label[0 .. 2] == "../"
            while label[0 .. 2] == "../"
                section_stack.pop() if section_stack.size() != 0
                label = label[3 .. label.size()-1]
            end
            # 3) subsection of the root-section
        else
            section_stack.clear
        end

        # 4) parse section name for slashes
        if label != ""
            i            = 0
            prev_slash_i = -1
            L            = label.size()
            for i in 0 .. L - 1
                if label[i] == "\/"[0] 
                    if i - prev_slash_i > 1 
                        section_stack.push(label[prev_slash_i .. i-1])
                    end
                    prev_slash_i = i
                end
            end
            if i - prev_slash_i > 1 
                section_stack.push(label[prev_slash_i .. i-1])
            end
        end
        section = ""
        section_stack.each{ | s |  section += s + "/" }
        return section
    end

    def __convert_to_type(str, default)
        # Converts a string into an object of the same type as 'default'.
        # Returns '''' in case this is not possible.
        begin
            if default.type == String
                return str 
            elsif default.type ==  Float
                return Float(str) 
            elsif default.type == Fixnum
                begin
                    return Integer(str)
                rescue
                    # in case it was a float, convert to float and 'cut'
                    return Integer(Float(str))
                end
            end
        rescue
        end
        return default
    end        

    def __get_remaining_string(str, start)
        # Checks if 'String' begins with 'Start' and returns the remaining String.
        # Returns None if String does not begin with Start. 
        if start == ""
            return str
        elsif str.index(start) == 0
            return str[start.length .. (str.length-1)]
        else
            return ""
        end
    end

    def search(*args)
        # Search for a command line argument and set cursor. Starts search
        # from current cursor position. Only wraps arround the end, if 'loop'
        # is enabled. Returns 'false' if nothing was found, 'true' if.
        @cursor = @argv.size()-1 if @cursor >= @argv.size()-1

        @search_failed_f = true
        old_cursor = @cursor

        if @cursor < @argv.size()
            # first run: from cursor to end
            for i in @cursor .. @argv.size() - 1
                curr_arg = @argv[i]
                for arg in args
                    if @prefix + arg == curr_arg
                        @cursor = i
                        @search_failed_f = false
                        return true
                    end
                end
            end
        end

        return false if @search_loop_f == false

        # second run: from 1 to old_cursor position
        # (note, that old_cursor can be at maximum = @argv.size(),
        #  the range function contains therefore only values until
        #  "@argv.size() - 1")
        for i in 1 .. (old_cursor - 1)
            curr_arg = @argv[i]
            for arg in args
                if @prefix + arg == curr_arg
                    @cursor = i
                    @search_failed_f = false
                    return true
                end
            end
        end

        return false
    end

    def disable_loop()
        @search_loop_f = false
    end

    def enable_loop()
        @search_loop_f = true
    end

    #     -- reset cursor to initial position
    def reset_cursor()
        @search_failed_f = false
        @cursor = 0
    end

    def search_failed() 
        return @search_failed_f	
    end

    def init_multiple_occurrence()
        disable_loop()
        reset_cursor()
    end

    def set_prefix(prefix)
        @prefix = prefix
    end

    # (*) direct access to command line arguments through []-operator
    def [](idx)
        # Returns a specific argument indexed by idx or '''' if this
        # does not exist.
        return @argv[idx] if idx >= 0 and idx < @argv.size()
        return ''
    end  

    def get(idx, default)
        # Looks if the type of argv[idx] matches the type of the default argument.
        # If it does not, the default argument is returned.
        string = self[idx]
        # does argument exist in list
        return default if string == ''
        # check if type corresponds to default argument
        # and convert to required type ('''' if not possible)
        return __convert_to_type(string, default)
    end  

    def size() # Returns the size of the argument list.
        return @argv.size()
    end
    #     -- get argument at cursor++
    #   remark: it could not be called 'next' since 'next' is a keyword.
    def nekst(default)
        return default if @search_failed_f      
        @cursor += 1
        if @cursor >= @argv.size()
            @cursor = @argv.size()-1
            return default
        end

        remain = __get_remaining_string(@argv[@cursor], @prefix)
        if remain != ""
            return __convert_to_type(remain, default)
        else
            return default
        end
    end

    #     -- search for option and get argument at cursor++
    def follow(default, *args)
        args.each{ | arg | return nekst(default) if search(arg) } 
        return default
    end

    def direct_follow(default, arg)
        remaining_string = __match_starting_string(arg)
        return default if remaining_string == ''
        @cursor += 1
        @cursor = @argv.size() if @cursor >= @argv.size()
        return __convert_to_type(remaining_string, default)
    end

    # helper to find directly followed arguments
    def __match_starting_string(startString)
        # Searches argument list for next occurrence of 'StartString', beginning
        # from actual cursor position. Returns string after StartString if found. 
        # Returns '' if not argument contains the starting string.
        old_cursor = @cursor    
        @search_failed_f = true
        # first run: from cursor to end
        if @cursor < @argv.size()
            for i in old_cursor .. @argv.size() - 1
                if @argv[i].index(startString) == 0
                    @cursor = i
                    @search_failed_f = false
                    return @argv[i][startString.size() .. @argv[i].size()]
                end
            end
        end

        return '' if @search_loop_f == false

        # second run: from 1 to old_cursor position
        # (note, that old_cursor can be at maximum = @argv.size(),
        #  the range function contains therefore only values until
        #  "@argv.size() - 1")
        for i in 1 ..  old_cursor - 1
            if @argv[i].index(startString) == 0
                @cursor = i
                @search_failed_f = false
                return @argv[i][startString.size() .. @argv[i].size()]
            end
        end

        return ''
    end

    # (*) flags
    def  options_contain(flagList)
        for arg in @argv
            if @prefix != ''
                arg = __get_remaining_string(arg, @prefix)
            end
            if arg.size() >=2 and arg[0] == ?- and arg[1] != ?-
                return true if __check_flags(arg, flagList) == true
            end
        end
        return false
    end

    def  argument_contains(idx, flagList)
        return false if idx < 0 or idx >= @argv.size()

        if @prefix == ""
            # no 'namespace' specified
            return __check_flags(@argv[idx], flagList)
        end

        # if a prefix is set, then the argument index is the index
        #   inside the 'namespace'
        # => only check list of arguments that start with prefix
        no_matches = 0
        @argv.each { | arg | 
            remain = __get_remaining_string(arg, @prefix)
        if remain != ""
            no_matches += 1
            if no_matches == idx
                return __check_flags(remain, flagList)
            end
        end
        }
        # no argument in this namespace
        return 0
    end

    # helper to search for flags
    def __check_flags(str, flagList)
        for k in 0 .. str.size() - 1
            letter = str[k]
            for i in 0 .. flagList.size() - 1
                flag = flagList[i]
                return true if flag == letter
            end
        end
        return false
    end    
    # (*) nominus arguments
    def reset_nominus_cursor()
        @nominus_cursor = -1
    end

    def nominus_vector()
        v_nm = []
        @idx_nominus.each{ | i | v_nm.push(@argv[i]) }
        return v_nm
    end

    def nominus_size()
        return @idx_nominus.size()
    end

    def next_nominus()
        return '' if @nominus_cursor >= @idx_nominus.size()-1
        @nominus_cursor += 1
        return @argv[@idx_nominus[@nominus_cursor]]
    end
    # (*) variables
    def get_variable_names()
        # return all variables for given prefix
        vars = []
        @variables.each { | v |  
            tmp = __get_remaining_string(v.name, @prefix)
        vars.push(tmp) if tmp != ""
        }
        return vars
    end

    def get_section_names()
        return @section_list
    end

    #     -- scalar values
    def call(varName, default, idx=-1)
        # Returns '''' in case variable was not found or type did not match.
        v = __find_variable(varName)
        return default if v == ''

        if idx == -1
            # variable has to be considered as a single value
            return __convert_to_type(v.original, default)
        else
            # variable interpreted as vector
            if idx >= v.value.size()
                return default
            else
                return __convert_to_type(v.value[idx], default)
            end
        end
    end

    def vector_variable_size()
        return variables.size()
    end

    # helper to find arguments
    def __find_variable(varName)
        v_name = @prefix + varName
        # Search for a variable in the array of variables.
        @variables.each { | v | return v if v.name == v_name }
        return ''
    end
    def Print()
        print "argc = %i\n" % @argv.size()
        @argv.each{ | arg | print "%s\n" % arg }
    end


    # (*) dollar bracket expressions (DBEs) ------------------------------------
    #
    #     1) Entry Function: DBE_expand_string()
    #        Takes a string such as
    #
    #          "${+ ${x} ${y}}   Subject-${& ${section} ${subsection}}:   ${title}"
    #
    #        calls DBE_expand() for each of the expressions
    #
    #           ${+ ${x} ${y}}
    #           ${& ${section} ${subsection}}
    #           ${Title}
    #
    #        and returns the string
    #
    #          "4711 Subject-1.01:   Mit den Clowns kamen die Schwaene"
    #
    #        assuming that
    #            x          = "4699"
    #            y          = "12"
    #            section    = "1."
    #            subsection = "01"
    #            title      = "Mit den Clowns kamen die Schwaene"
    #
    #      2) DBE_expand():
    #
    #           checks for the command, i.e. the 'sign' that follows '${'
    #           divides the argument list into sub-expressions using
    #           DBE_get_expr_list()
    #
    #           ${+ ${x} ${y}}                 -> "${x}"  "${y}"
    #           ${& ${section} ${subsection}}  -> "${section}" "${subsection}"
    #           ${Title}                       -> Nothing, variable expansion
    #
    #      3) DBE_expression_list():
    #
    #           builds a vector of unbracketed whitespace separated strings, i.e.
    #
    #           "  ${Number}.a ${: Das Marmorbild} AB-${& Author= ${Eichendorf}-1870}"
    #
    #           is split into a vector
    #
    #              [0] ${Number}.a
    #              [1] ${: Das Marmorbild}
    #              [2] ${& Author= ${Eichendorf}}
    #
    #           The each sub-expression is expanded using expand(). 
    #---------------------------------------------------------------------------    
    def DBE_expand_string(str)
        """Parses for closing operators '${ }' and expands them letting
         white spaces and other letters as they are."""
         new_string = ""
         open_brackets = 0

         for i in 0 .. str.size() - 1
             if i < str.size() - 1 and str[i .. i+1] == "${"
                 if open_brackets == 0 
                     first = i+2
                 end
                 open_brackets += 1
             elsif str[i] == ?} and open_brackets > 0
                 open_brackets -= 1
                 if open_brackets == 0
                     replacement = DBE_expand(str[first .. i-1])
                     new_string += replacement
                 end
             elsif open_brackets == 0
                 new_string << str[i]
             end
         end
         return new_string
    end

    def DBE_get_expr_list(str, expectedNumber)
        # Separates expressions by non-bracketed whitespaces, expands them
        # and puts them into a list.

        # (1) eat initial whitespaces
        for i in 0 .. str.size() - 1
            letter = str[i]
            if letter != ?\s and letter != ?\t and letter != ?\n
                break
            end
        end

        expr_list = []
        open_brackets = 0
        start_idx = []
        start_new_string = i
        l = str.size()
        # (2) search for ${ } expressions ...
        while i < l
            letter = str[i]
            # whitespace -> end of expression
            if (letter == ?\s  or letter == ?\t or letter == ?\n) \
                and open_brackets == 0
                expr_list.push(str[start_new_string .. i-1])
                no_breakout_f = 1
                for i in i+1 .. l-1
                    letter = str[i]
                    if letter != ?\s and letter != ?\t and letter != ?\n
                        no_breakout_f = 0
                        start_new_string = i
                        break
                    end
                end
                if no_breakout_f == 1
                    # end of expression list
                    if expr_list.size() < expectedNumber
                        expr_list.concat(["<< ${ }: missing arguments>>"] * (expectedNumber - expr_list.size()))
                    end	  
                    return expr_list
                end
            end

            # dollar-bracket expression
            if str.size() >= i+2 and str[i .. i+1] == "${"
                open_brackets += 1
                start_idx.push(i+2)
            elsif letter == ?} and open_brackets > 0
                start = start_idx.pop()
                replacement = DBE_expand(str[start .. i-1]) 
                if start - 3 < 0
                    str = replacement + str[i+1 .. l-1]
                else
                    str = str[0 .. start-3] + replacement + str[i+1 .. l-1]
                end
                l = str.size()                
                i = start + replacement.size() - 3
                open_brackets -= 1
            end
            i += 1
        end

        # end of expression list
        expr_list.push(str[start_new_string .. i-1])

        if expr_list.size() < expectedNumber
            expr_list.concat(["<< ${ }: missing arguments>>"] * (expectedNumber - expr_list.size()))
        end

        return expr_list
    end

    def DBE_get_variable(varName)
        secure_Prefix = @prefix

        for p in [@section, ""]
            @prefix = p
            # (1) first search in currently active section
            # (2) search in root name space
            var = __find_variable(varName)
            if var != ''
                @prefix = secure_Prefix
                return var
            end
        end
        @prefix = secure_Prefix
        return "<<${ } variable '%s' undefined>>" % varName
    end

    def DBE_expand(expr)    
        # pretty_print("expand %s" % expr)
        # ${: } pure text
        if expr[0] == ?:
            return expr[1 .. expr.size()-1]

            # ${& expr expr ... } text concatination
        elsif expr[0] == ?&
            a = DBE_get_expr_list(expr[1 .. expr.size()-1], 1)
            return reduce(lambda{ | a,b |  "%s%s" % [a, b]}, a)

            # ${<-> expr expr expr} text replacement
        elsif expr.size() >= 3 and expr[0..2] == "<->"
            a = DBE_get_expr_list(expr[3 .. expr.size()-1], 3)
            #           string  old   new
            return a[0].gsub(a[1], a[2])

            # ${+ ...}, ${- ...}, ${* ...}, ${/ ...} expressions
        elsif expr[0] == ?+
            a = DBE_get_expr_list(expr[1 .. expr.size()-1], 2)
            return reduce(lambda{ | a, b | __convert_to_type(a, 0.0) + __convert_to_type(b, 0.0)}, a).to_s

        elsif expr[0] == ?-
            a = DBE_get_expr_list(expr[1 .. expr.size()-1], 2)
            return reduce(lambda{ | a, b | __convert_to_type(a, 0.0) - __convert_to_type(b, 0.0)}, a).to_s

        elsif expr[0] == ?*
            a = DBE_get_expr_list(expr[1 .. expr.size()-1], 2)
            return reduce(lambda{ | a, b | __convert_to_type(a, 0.0) * __convert_to_type(b, 0.0)}, a).to_s

        elsif expr[0] == ?/
            a = DBE_get_expr_list(expr[1 .. expr.size()-1], 2)
            mq = __convert_to_type(a[0], 0.0)
            if mq == 0 
                return "0.0"
            end
            for arg in a[1 .. a.size()-1] 
                q = __convert_to_type(arg, 0.0)
                if q == 0.0 
                    return "0.0"
                end
                mq = mq / q
            end
            return mq.to_s

            # ${^ ... } power expressions
        elsif expr[0] == ?^
            a = DBE_get_expr_list(expr[1 .. expr.size()-1], 2)
            result = reduce(lambda{ | a, b | __convert_to_type(a, 0.0) ** __convert_to_type(b,0.0)},
                            a)
            return result.to_s

            # ${==  } ${<=  } ${>= } comparisons (return the number of the first 'match'
        elsif expr.size() and \
            (expr[0..1] == "==" or expr[0..1] == ">=" or expr[0..1] == "<=" or \
             expr[0] == ?> or expr[0] == ?< )
            # differentiate between two and one sign operators
            if expr[1] == ?=
                op =  expr[0 .. 1] 
                a = DBE_get_expr_list(expr[2 .. expr.size()-1], 2)
            else              
                op =  expr[0]   
                a = DBE_get_expr_list(expr[1 .. expr.size()-1], 2)
            end
            x_orig = a[0]            
            x = __convert_to_type(x_orig, 1e37)
            i = 1

            for y_orig in a[1 .. a.size()-1]
                y = __convert_to_type(y_orig, 1e37)
                # set the strings as reference if one wasn't a number
                if x == 1e37 or y == 1e37 
                    xc = x_orig; y = y_orig
                else                      
                    xc = x
                end

                if(op == "==" and xc == y) or (op == ">=" and xc >= y) or \
                    (op == "<=" and xc <= y) or (op == ?>   and xc > y)  or \
                    (op == ?<   and xc < y)  
                    return i.to_s
                end
                i += 1
            end
            # nothing fulfills the condition => return 0
            return "0"

            # ${?? expr expr} select 
        elsif expr.size() >= 2 and expr[0..1] == "??"
            a = DBE_get_expr_list(expr[2 .. expr.size()-1], 2)
            x = __convert_to_type(a[0], 1e37)
            # last element is always the default argument
            if x == 1e37 or x < 0 or x >= a.size() - 1
                return a[-1]
            end
            # round x to closest integer
            return a[(x+0.5).to_i]

            # ${? expr expr expr} if then else conditions
        elsif expr[0] == ??
            a = DBE_get_expr_list(expr[1 .. expr.size()-1], 2)
            if __convert_to_type(a[0], 0.0) == 1.0
                return a[1]
            elsif a.size() > 2
                return a[2]
            end

            # ${! expr} maxro expansion 
        elsif expr[0] == ?!
            var = DBE_get_variable(expr[1 .. expr.size()-1])
            # error
            if var.type == String
                return var
            end
            a = DBE_get_expr_list(var.original, 2)
            return a[0]

            # ${@: } - string subscription
        elsif expr.size() >= 2 and expr[0..1] == "@:"
            a = DBE_get_expr_list(expr[2 .. expr.size()-1], 2)            
            x = __convert_to_type(a[1], 1e37)

            # last element is always the default argument
            if x == 1e37 or x < 0 or x >= a[0].size() - 1
                return "<<1st index out of range>>"
            end
            if a.size() > 2
                y = __convert_to_type(a[2], 1e37)
                if y != 1e37 and y > 0 and y <= a[0].size() - 1 and y > x
                    return a[0][(x+0.5).to_i .. (y+0.5).to_i]
                elsif y == -1
                    return a[0][(x+0.5).to_i .. a[0].size()-1]
                end
                return "<<2nd index out of range>>"                            
            else
                tmp = ""; tmp << a[0][(x+0.5).to_i]
                return tmp
            end
            # ${@ } - vector subscription
        elsif expr[0] == ?@
            a = DBE_get_expr_list(expr[1 .. expr.size()-1], 2)
            var = DBE_get_variable(a[0])
            # error
            if var.type == String
                return var
            end

            x = __convert_to_type(a[1], 1e37)

            print "x=%s, [%i]\n" % [ x, a[0].size() -1 ]

            # last element is always the default argument
            if x == 1e37 or x < 0 or x >= var.value.size()
                return "<<1st index out of range>>"
            end
            if a.size() > 2
                y = __convert_to_type(a[2], 1e37)
                if y != 1e37 and y > 0 and y <= var.value.size() and y > x
                    vec = var.value[(x+0.5).to_i .. (y+0.5).to_i]
                elsif y == -1
                    vec = var.value[(x+0.5).to_i .. var.value.size()-1]
                else
                    return "<<2nd index out of range>>" 
                end
                return reduce(lambda{ | a, b | "%s %s" % [a,b] }, vec)
            else
                return var.value[(x+0.5).to_i]
            end
        end

        a = DBE_get_expr_list(expr, 1)	
        b = DBE_get_variable(a[0])

        if b.type == String 
            return b
        else 
            return b.original
        end
    end

    # (*) unidentified flying objects
    def unidentified_arguments(*knowns)
        ufos = []
        for it in @argv[1 ... @argv.size]
            arg = __get_remaining_string(it, @prefix)
            ufos << it if knowns.index(arg) == nil      
        end
        return ufos
    end

    def unidentified_options(*knowns)
        ufos = []
        for it in @argv[1 ... @argv.size]
            arg = __get_remaining_string(it, @prefix)
            if arg.size < 2 or arg[0] != ?-
                next
            end
            ufos << it if knowns.index(arg) == nil      
        end
        return ufos
    end

    def unidentified_flags(knownFlags, argumentNumber=-1)
        ufos = ""
        if argumentNumber == -1
            # (*) search through all options with one single '-'
            for it in @argv[1 ... @argv.size]
                arg = __get_remaining_string(it, @prefix)
                if arg.size < 2
                    next
                elsif arg[0] != ?-
                    next
                elsif arg[1] == ?-
                    next
                end

                for i in 1 .. arg.size()
                    letter = arg[i .. i]
                    if knownFlags.index(letter) == nil
                        ufos << letter
                    end
                end
            end
        else
            no_matches = 0
            for it in @argv[1 ... @argv.size]
                remain = __get_remaining_string(it, @prefix)
                if remain != "" 
                    no_matches += 1
                    if no_matches = argumentNumber
                        # -- the right argument number inside the section is found
                        # => check it for flags
                        for letter in remain
                            ufos += letter if knownFlags.index(letter) == nil
                        end
                        return ufos
                    end
                end
            end
        end
        return ufos
    end

    def unidentified_variables(*knowns)
        ufos = []
        for it in @variables
            var_name = __get_remaining_string(it.name, @prefix)
            ufos << it.name if knowns.index(var_name) == nil
        end
        return ufos
    end

    def unidentified_sections(*knowns)
        ufos = []
        for it in @section_list
            sec_name = __get_remaining_string(it, @prefix)
            ufos << it if knowns.index(sec_name) == nil
        end
        return ufos
    end

    def unidentified_nominuses(knowns)
        ufos = []
        for it in @argv[1 ... @argv.size]
            arg = __get_remaining_string(it, @prefix)
            # only 'real nominuses'
            if arg.size < 1 or arg[0] == ?-
                next
            elsif arg[0] == ?[ and arg[-1] == ?]
                next # section label
            elsif arg.index(?=) != nil
                next # variable definition
            end
            ufos << it if knowns.index(arg) == nil
        end
        return ufos
    end

end

def reduce(function, vector)
    result = vector[0]
    for v in vector[1 .. vector.size() - 1]
        result = function.call(result, v)
    end
    return result
end
                                                                                                                                                              ruby/emacs-getpot-mode.el.gz                                                                        0000755 0001750 0001750 00000001772 13177705753 016123  0                                                                                                    ustar   fschaef                         fschaef                                                                                                                                                                                                                �_�y;emacs-getpot-mode.el �UkO�F����+�R�Ul��JT�,%�G�!���ľ��Lf,���3~�Xh�U�Q��s�}x4����mMZY�LI��fƑ�E��ز�2���FѿY�Ǉ��������3+�ɚ�=��G�3%BSɩ�����1IGB���l1�Yf;�]�]��[K&��9���K���*ͥP4��J&-��LX[&a���6�ֻ:v�	-ZB41�B8i�X���ȥ�.����u@0�/��R�)|p;R��F��ɋ�騱sS@cT�~�Jњ���UjТ�y��./nn�4�����|>�^ޏ��N��4�-�8$�B�� Wg��D��L/��{/e2]^�-4��Әf��rzz{9���v>�Y��D�������ݗ���ޔ��ʾ��`�V���GF!$,�UPb��7gX��@؋�#�i��TJT�3�s�"�T���:���O�d8�4S"A���8::�c��jLtp8�����D��q�q\�����h��5�|/��<��p�}ފ��D�M��-|��řr7 sLn��x1���		9� ц]a\�������7Wg�q}\G�/�k�F��nk ���
�5fj��#�L�̏�v~�S���쩨���u�o��#�����X�S/�u���4�{����?�\݀���Y�&�[�I"�{�A�I�M�>�M����~ǐ�f7�Tm*����`X�� 4�i�䂳z
����~�Y�r�WfGY������R���(am�}R����J�]��t�6h!(\��;�U�7
�t�B�A6�D}GoW���JjTd�= nG��u*u*Qc���&�6�<�R��4�-ߢ��>�֥I�����k�F�`�Ȥ������ǻ��/�Q�O�A�(h q�O��j�_�~�?�V��Va@�7��)��8 �8�4;_Ž7?|oi��7d�ݯ.wU6�4�;ꇘ
�e�BE&\�L����,�_jp���                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        