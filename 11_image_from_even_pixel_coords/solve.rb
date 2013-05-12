# Uses RMagick gem (because ChunkyPNG can only read... PNGs :-)
require 'RMagick'
include Magick

img_in = Image.read('cave.jpg').first
img_out = Image.new(img_in.columns, img_in.rows) do
  self.background_color = 'black'
end

img_in.each_pixel do |pixel, x, y|
  img_out.pixel_color(x, y, pixel) if x.even? && y.even?
end

img_out.write('output.jpg')
