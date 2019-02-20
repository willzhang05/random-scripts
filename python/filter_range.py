#!/usr/bin/python3
## This script is used for grading assignments from UVa Collab. 
## It takes a range of student IDs to keep and removes the directories that don't need to be graded.
import sys, os
import re
import shutil

def main():
    
    if (len(sys.argv) < 4):
        print("Please specify a directory and start and end IDs")
        print("Usage: ./filter_range.py <directory> <start ID> <end ID>")
        return 1
    else:
        start = sys.argv[2]
        end = sys.argv[3]
        print("Start: " + start)
        print("End: " + end)
        os.chdir(sys.argv[1])
        folders = [o for o in os.listdir() if os.path.isdir(o)]
        folders = sorted(folders,key=lambda x : re.findall(r"(.*?), (.*?)\(",x)[0])
        filtered = list()
        in_range = False
        for f in folders:
            sid = re.findall(r"(\w+)",f)[-1]
            if (sid == start):
                in_range = True
            elif (sid == end):
                in_range = False
            else:
                if (not in_range):
                    filtered.append((sid,f))
        for f in filtered:
            shutil.rmtree(f[1])
        print([o for o in os.listdir() if os.path.isdir(o)])

if __name__ == "__main__":
    main()
