content = File.binread("evil2.gfx")
files_out = 5.times.map { |i| File.new("out#{i}.jpg", "w") }

content.chars.each_slice(5) do |bytes| 
  bytes.each_with_index { |byte, i| files_out[i] << byte }
end

files_out.each(&:close)