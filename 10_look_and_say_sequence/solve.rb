def look_and_say(str)
  res = ""
  c = 1
  
  (1..str.size).each do |i|
    if str[i] == str[i-1]
      c += 1
    else
      res << c.to_s + str[i-1]
      c = 1
    end
  end
  
  res
end

def look_and_say_sequence(nb_elems)
  seq = ["1"]
  
  (1..nb_elems-1).each do
    seq << look_and_say(seq.last)
  end
  
  seq
end

puts look_and_say_sequence(31).last.size

