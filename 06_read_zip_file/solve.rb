# Uses rubyzip gem
require 'zip/zip'

nothing = '90052'
output = ''

Zip::ZipFile.open('channel.zip') do |zipfile|
  loop do
    content = zipfile.read("#{nothing}.txt")

    puts content

    if content =~ /Next nothing/
      output << zipfile.get_entry("#{nothing}.txt").comment
      nothing = content.split.last
    else
      puts output
      exit
    end
  end
end
