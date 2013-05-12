# Uses RMagick gem
require 'RMagick'
include Magick

DIRECTIONS = [[:right, 1, 0], [:down, 0, 1], [:left, -1, 0], [:up, 0, -1]]

img_in = Image.read('wire.png').first
img_out = Image.new(100, 100)

line_length = 100
img_in_index = 0
x, y = [-1, 0]

while line_length > 0

  DIRECTIONS.each do |direction, dx, dy|
    line_length.times do
      x += dx
      y += dy

      img_out.pixel_color(x, y, img_in.pixel_color(img_in_index, 0))

      img_in_index += 1
    end

    line_length -= 1 if direction == :right || direction == :left
  end

end

img_out.write('output.jpg')
