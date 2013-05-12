require 'zlib'
# Uses bzip2-ruby gem
require 'bzip2'

def is_zlib(str)
  get_signature(str) == '789c'
end

def is_bzip2(str)
  get_signature(str) == '425a'
end

# Gets the first 2 bytes of str, in hexadecimal format
def get_signature(str)
  str[0..1].unpack('H*').first
end


content = File.read('package.pack')
finished = false
ascii_logs = ''

until finished do
  if is_zlib(content)
    ascii_logs += ' '

    content = Zlib::Inflate.inflate(content)
  elsif is_bzip2(content)
    ascii_logs += 'a'

    content = Bzip2.uncompress(content)
  else
    ascii_logs += "\n"

    content = content.reverse
    finished = true unless is_zlib(content)
  end
end

puts "#{content}\n\n"
puts ascii_logs
