# stegano
Command line steganography tool

Description - Stegano is an image steganography tool designed to facilitate the embedding and extraction of zip files into/from image files. 

Requirements - Ruby 2.0+

Setup directions - Stegano can be ran as a normal ruby script 'ruby stegano.rb'
To run stegano as a command line tool from any directory follow these instructions
- place stegano.rb in usr/local/bin.
- rename stegano.rb stegano `mv stegano.rb stegano`
- enable executable permissions `chmod +x stegano`
stegano is now able to be called from any directory as such

Usage:
        stegano [-hd]

Options:
        -h      Display help page
	-d      Copy any hidden data appended to image file into current directory.

Exit Status:
        Exit 0 upon success >0 upon error.

Examples:

	stegano image.jpeg data.zip
Appends data.zip after the terminating byte of image.jpeg
 	
	stegano -d image.jpeg
Copy and unzip any appended data from image into current directory
