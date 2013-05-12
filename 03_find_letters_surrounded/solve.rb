content = File.read('data.txt')

# Least characters
puts content.scan(/[a-z][A-Z]{3}([a-z])[A-Z]{3}[a-z]/).join

# Clearer intention but less readable
# puts content.scan(/\p{Lower}\p{Upper}{3}(\p{Lower})\p{Upper}{3}\p{Lower}/).join

# Totally unreadable !
# puts content.scan(/[[:lower:]][[:upper:]]{3}([[:lower:]])[[:upper:]]{3}[[:lower:]]/).join
