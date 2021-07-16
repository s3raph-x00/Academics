#this was copied from Learn Python the Hard way exercise.
from sys import argv
from os.path import exists

#this is the main function to convert hexadecimal to decimal
def hex2dec (hex):
    result_dec = int(hex, 0)
    return result_dec

#this to accept parameter from command-line
script, from_file = argv

#this to make sure the output generate as a new file with _1
to_file = from_file[:-4] + "_1.txt"
out_file = open(to_file, 'w').close()

#this took me a few hour to figure out a bug. Thanks to stackoverflow
with open(from_file) as in_file:
    lines = in_file.read().splitlines()

for i in lines:
    converted = str(hex2dec (i))
    out_file = open(to_file, 'a+')
    out_file.write(converted + "\n")
    out_file.close()

    #this to print the result for reference on-screen.
    print "converted =" + str(converted)

print "done."
