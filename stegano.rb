#!/usr/bin/env ruby
image_file = ARGV[0]
zip_file = ARGV[1]
help_page =
    "Name:\n\tstegano -- Hide data in images\n
    \rSynopsis:\n\tstegano\t[-hd]\n
    \rDescription:\n\tThe stegano utility appends data to image files.\n
    \rOptions:\n\t-h\tDisplay help page\n\n\t-d\tCopy any hidden data appended to image file into current directory.\n
    \rExit Status:\n\tExit 0 upon success >0 upon error.\n
    \rExamples:\n\tstegano image.jpeg data.zip\n\tAppends data.zip after the terminating byte of image.jpeg
  "

def alert_msg(mode, status)
  puts "#{mode}" << ( status ? " complete!" : " failed!")
  exit(status)
end

def pack_zip(image_file, zip_file, out_file)
  mode = "Steganography"
  status = system("cat #{image_file} #{zip_file} > #{out_file}")
  alert_msg(mode, status)
end

def unpack_zip(packed_file)
  mode = 'Desteganography'
  status = !system("unzip #{packed_file} > /dev/null 2>&1")
  alert_msg(mode, status)
end

if image_file == '-h'
  abort(help_page)
end

if image_file == '-d'
  unpack_zip(zip_file)
else
  if image_file && zip_file != nil
    puts "Choose an image filename to hide content to (same filetype as image in argument 1):"
    out_file = STDIN.gets.chomp
    pack_zip(image_file, zip_file, out_file)
  else
    abort(help_page)
  end
end


