require 'net/http'

url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing="
nothing = "12345"

400.times do
  uri = URI("#{url}#{nothing}")
  response = Net::HTTP.get(uri)

  puts response
  
  case response
  when /Divide by two/
    nothing = nothing.to_i / 2
  when /.html/
    exit
  else
    nothing = response.split[-1]
  end
end

