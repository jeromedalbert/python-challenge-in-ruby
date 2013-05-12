require 'date'

year = 1996
nb_found = 0
date = nil

# We must find 2 because of hint "he ain't the youngest, he is the second"
until nb_found == 2
  date = Date.new(year, 01, 26)

  nb_found += 1 if date.monday? && date.leap?

  year -= 10
end

puts date # 27 January 1756 is Mozart's birthday
