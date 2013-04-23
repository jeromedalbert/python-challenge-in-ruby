# Uses Mail gem
require 'mail'
# Uses RMagick gem
require 'RMagick'
# Uses wav-file gem
require 'wav-file'

def create_wav_file
  mail = Mail.read('mail.txt')
  attachment = mail.attachments.first

  File.open(attachment.filename, "w") { |file| file.write(attachment.body) }
end

def reverse_india_image
  img_in = Magick::Image.read("map.jpg").first
  
  img_out = img_in.negate
  
  img_out.write('map_reversed.jpg')
end

def reverse_wav_file_endianness
  format, data_chunk = nil, nil
  
  File.open("indian.wav") do |file|
    format = WavFile::readFormat(file)
    data_chunk = WavFile::readDataChunk(file)
  end
  
  puts <<-EOS
Each wav sample has #{format.bitPerSample} bits, so a sample is composed of #{format.bitPerSample / 8} bytes.
Let's reverse the endianness of these bytes.
EOS
  
  samples = data_chunk.data.chars
  data_chunk.data = samples.each_slice(2).map { |byte1, byte2| [byte2, byte1] }.join
  
  File.open("indian_reversed.wav", "w") do |file|
    WavFile::write(file, format, [data_chunk])
  end
end

create_wav_file       # Result : wav file says "sorry" : not very helpful.
reverse_india_image   # Result : India image was a reversed image. This is a hint to "reverse India", i.e. "reverse endianness"
reverse_wav_file_endianness
puts "Done"