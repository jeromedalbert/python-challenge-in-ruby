require 'net/http'

SITE_URI = URI('http://www.pythonchallenge.com/pc/hex/unreal.jpg')

def http_get(range_start)
  req = Net::HTTP::Get.new(SITE_URI.request_uri)
  req.basic_auth('butter', 'fly')
  req['Range'] = "bytes=#{range_start}-"

  Net::HTTP.new(SITE_URI.host, SITE_URI.port).request(req)
end

def get_next_range_start(move_up, res)
  if move_up
    res['Content-range'][/-(\d+)/, 1].to_i + 1
  else
    res['Content-range'][/\d+/].to_i - 1
  end
end


finished = false
range_start = 30203
move_up = true

until finished do
  res = http_get(range_start)

  puts "Content-range: #{res['Content-range']}"
  puts "Body: #{res.body}\n"

  if res.body =~ /you are inside/
    range_start = res['Content-range'][/\d+$/]
    move_up = false
  elsif res.body =~ /hiding at/
    range_start = res.body[/\d+/]
    finished = true
  else
    range_start = get_next_range_start(move_up, res)
  end
end

res = http_get(range_start)
File.open('output.zip', 'w') { |file| file.write(res.body) }
