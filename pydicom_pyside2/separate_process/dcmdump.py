# Sample application to launch dcmdump.exe in a separate process
# USAGE
# To dump all the contents of a file 'liver.dcm', execute the following:
# python dcmdump.py -f "C:\temp\liver.dcm"
#
# To dump all the contents of a file 'liver.dcm' and display tags in tree structure, execute the following:
# python dcmdump.py -f "C:\temp\liver.dcm" -t
#
import subprocess
import argparse

# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-t", "--tree", help="Print hierarchical structure as a simple tree", action="store_true")
ap.add_argument("-f", "--filename", required=True, help="Full path of the filename")

# read all arguments
args = vars(ap.parse_args())

if args["tree"]:
    print_tree = "+T"
else:
    print_tree = "-T"

# call dcmdump.exe in a separate process
DCMDUMP_PATH = "C:\\dev\\dcmtk\\build\\install\\bin\\dcmdump.exe"
subprocess.call([DCMDUMP_PATH, print_tree, args["filename"]])

