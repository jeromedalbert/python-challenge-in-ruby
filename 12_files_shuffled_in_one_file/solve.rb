content = File.binread('evil2.gfx')
files_out = 5.times.map { |i| File.new("out#{i}.jpg", 'w') }

content.chars.each_slice(5) do |chars|
  chars.each_with_index { |char, i| files_out[i] << char }
end

files_out.each(&:close)
