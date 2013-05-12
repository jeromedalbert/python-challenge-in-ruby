# IO.read (or File.read) automatically close the file, so no worries ! No need
# to use File.open
content = File.read('data.txt')

# Least characters, most readable IMO
puts content.scan(/[a-zA-Z]/).join

# Not too bad. Readable if you just have one of these.
# puts content.scan(/[[:alpha:]]/).join

# Ditto
# puts content.scan(/\p{Alpha}/).join
