require 'net/http'
require 'cgi'
require 'bzip2'
require 'xmlrpc/client'

# Level 17 browser cookies tell us that "busynothing" is the parameter to use.
URL_LVL_16 = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing='
URL_LVL_13 = 'http://huge:file@www.pythonchallenge.com/pc/phonebook.php'

def solve_level_7_part
  busynothing = '12345'

  finished = false
  result = ''

  until finished
    res = Net::HTTP.get_response(URI("#{URL_LVL_16}#{busynothing}"))
    cookies = res['Set-Cookie']

    info_cookie = cookies[/info=([^;]*)/, 1]
    result << info_cookie

    if res.body =~ /that's it/
      finished = true
    else
      puts res.body
      busynothing = res.body.split.last
    end
  end

  puts
  puts Bzip2.uncompress(CGI::unescape(result))
  puts
end

def solve_level_13_part
  server = XMLRPC::Client.new2(URL_LVL_13).proxy
  puts server.phone('Leopold')
  puts
end

def call_leopold
  solve_level_13_part

  uri = URI('http://www.pythonchallenge.com/pc/stuff/violin.php')
  req = Net::HTTP::Get.new(uri.request_uri)
  req['Cookie'] = 'info=the flowers are on their way'

  res = Net::HTTP.new(uri.host, uri.port).request(req)
  puts res.body
end

solve_level_7_part
call_leopold
