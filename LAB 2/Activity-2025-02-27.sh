#!/bin/bash

#Create an empty file
touch Test_filie 

#Change the file mode to readable and writable
chmod 600 Test_file

#To make it readable by the group
chmod 640 Test_file

#No permission to other
chmod 640 Test_file

#Showing above permission
ls -l Test_file

#Opening the text file
gedit Test_file &
disown

#opening firefox and github in it
firefox https://github.com &
disown

