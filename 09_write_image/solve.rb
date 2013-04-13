# Uses Chunky PNG gem
require 'chunky_png'
include ChunkyPNG

def draw_pixels(input_file, img)
  coords = File.read(input_file).split(/,\n?/).map(&:to_i)
  
  coords.each_slice(2) { |x, y| img[x, y] = Color::BLACK }
end


img = Image.new(640, 480, Color::WHITE)

draw_pixels("first.txt", img)
draw_pixels("second.txt", img)

img.save("output.png")