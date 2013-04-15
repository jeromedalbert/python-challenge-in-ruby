# Uses RMagick gem
require 'RMagick'
include Magick

MAGENTA = Pixel.from_color("magenta")

def straighten_magenta(pixel_line)
  index = pixel_line.each_with_index.find { |pixel, i| pixel == MAGENTA }.last
  
  pixel_line[index..-1] + pixel_line[0..index-1]
end


img_in = Image.read("mozart.gif").first
width, height = [img_in.columns, img_in.rows]

img_out = Image.new(width, height)

height.times do |y|
  pixel_line = img_in.get_pixels(0, y, width, 1)
  
  pixel_line = straighten_magenta(pixel_line)
  
  img_out.store_pixels(0, y, width, 1, pixel_line)
end

img_out.write("output.jpg")