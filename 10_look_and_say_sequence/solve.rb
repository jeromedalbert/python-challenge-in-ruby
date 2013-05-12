def look_and_say(str)
  res = ''
  count = 1

  (1..str.size).each do |i|
    if str[i] == str[i - 1]
      count += 1
    else
      res << count.to_s + str[i - 1]
      count = 1
    end
  end

  res
end

def look_and_say_sequence(nb_elems)
  seq = ['1']

  (1...nb_elems).each do
    seq << look_and_say(seq.last)
  end

  seq
end

puts look_and_say_sequence(31).last.size
