# Uses RMagick gem (because ChunkyPNG can only read... PNGs :-)
require 'RMagick'
include Magick

img_in = Image.read("cave.jpg").first
img_out = Image.new(img_in.columns, img_in.rows) { self.background_color = "black" }

img_in.each_pixel { |p, x, y| img_out.pixel_color(x, y, p) if x.even? && y.even? }

img_out.write("output.jpg")