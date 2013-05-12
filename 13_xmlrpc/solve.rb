require 'xmlrpc/client'

URL = 'http://huge:file@www.pythonchallenge.com/pc/phonebook.php'

server = XMLRPC::Client.new2(URL).proxy
puts server.phone('Bert') # Bert is written in evil4.png from previous level
