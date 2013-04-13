require 'xmlrpc/client'

server = XMLRPC::Client.new2("http://huge:file@www.pythonchallenge.com/pc/phonebook.php").proxy

puts server.phone('Bert') # Bert is written in evil4.png from previous level

