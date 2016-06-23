#!/usr/bin/python

import sys
import os
import random
from subprocess import call

path = "/home/fox/gdrive/Wallpaper"
files = os.listdir(path)

wallpaper = path + "/" + random.choice(files)
print (wallpaper)

call(["ChangeBackground.sh", wallpaper])
