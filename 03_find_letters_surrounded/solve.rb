content = File.read("data.txt")

puts content.scan(/[a-z][A-Z]{3}([a-z])[A-Z]{3}[a-z]/).join # Least characters
# puts s.scan(/\p{Lower}\p{Upper}{3}(\p{Lower})\p{Upper}{3}\p{Lower}/).join # Not too bad
# puts s.scan(/[[:lower:]][[:upper:]]{3}([[:lower:]])[[:upper:]]{3}[[:lower:]]/).join # Totally unreadable !
