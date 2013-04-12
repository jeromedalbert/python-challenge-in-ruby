content = File.read("data.txt") # IO.read (or File.read) automatically close the file, so no worries ! No need to use File.open

puts content.scan(/[a-zA-Z]/).join     # Least characters, most readable IMO
#puts content.scan(/[[:alpha:]]/).join # Not too bad. Readable if you just have one of these.
#puts content.scan(/\p{Alpha}/).join   # Ditto