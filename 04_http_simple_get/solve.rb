require 'net/http'

URL = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='

finished = false
nothing = '12345'

until finished do
  uri = URI("#{URL}#{nothing}")
  response = Net::HTTP.get(uri)

  puts response

  case response
  when /Divide by two/
    nothing = nothing.to_i / 2
  when /.html/
    finished = true
  else
    nothing = response.split.last
  end
end
