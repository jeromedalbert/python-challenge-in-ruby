require 'net/http'
require 'cgi'
require 'bzip2'
require 'xmlrpc/client'

def solve_level6_part
  # Level 17 browser cookies tell us that "busynothing" is the parameter to use.
  url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing="
  busynothing = "12345"

  finished = false
  result = ""

  until finished
    res = Net::HTTP.get_response(URI("#{url}#{busynothing}"))
    cookies = res['Set-Cookie']
  
    infoCookie = cookies[/info=([^;]*)/, 1]
    result << infoCookie
  
    if res.body =~ /that's it/
      finished = true
    else
      puts res.body
      busynothing = res.body.split[-1]
    end
  end

  puts
  puts Bzip2.uncompress(CGI::unescape(result))
  puts
end

def solve_level13_part
  server = XMLRPC::Client.new2("http://huge:file@www.pythonchallenge.com/pc/phonebook.php").proxy
  puts server.phone('Leopold')
  puts
end

def call_leopold
  solve_level13_part
  
  uri = URI("http://www.pythonchallenge.com/pc/stuff/violin.php")
  req = Net::HTTP::Get.new(uri.request_uri)
  req['Cookie'] = "info=the flowers are on their way"
  
  res = Net::HTTP.new(uri.host, uri.port).request(req)
  puts res.body
end

solve_level6_part
call_leopold
