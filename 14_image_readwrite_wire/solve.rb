# Uses RMagick gem
require 'RMagick'
include Magick
  
module Magick
  class Image
    alias_method :width, :columns
  end
end

Point = Struct.new(:x, :y)

Incr = { left: [-1, 0], right: [1, 0],
         up:   [0, -1], down:  [0, 1] }

def draw_lines(img_in, img_out)
  img_in_x = 0
  pos = Point.new(0, 0)
  line_length = img_out.width

  while img_in_x < img_in.width
    img_in_x += draw_line(pos, :right, line_length, img_in, img_in_x, img_out)
    pos = Point.new(pos.x + line_length - 1, pos.y + 1)
    line_length -= 1        
    
    img_in_x += draw_line(pos, :down,  line_length, img_in, img_in_x, img_out)
    pos = Point.new(pos.x - 1, pos.y + line_length - 1)
    
    img_in_x += draw_line(pos, :left, line_length, img_in, img_in_x, img_out)
    pos = Point.new(pos.x - line_length + 1, pos.y - 1)
    line_length -= 1
    
    img_in_x += draw_line(pos, :up, line_length, img_in, img_in_x, img_out)
    pos = Point.new(pos.x + 1, pos.y - line_length + 1)
  end
end

def draw_line(pos, dir, line_length, img_in, offset, img_out)      
  line_length.times do |i|
    color = img_in.pixel_color(offset + i, 0)
    
    img_out.pixel_color(pos.x + i * Incr[dir].first,
                        pos.y + i * Incr[dir].last,
                        color)
  end
  
  line_length
end




img_in = Image.read("wire.png").first

side_length = Math.sqrt(img_in.width)
img_out = Image.new(side_length, side_length)

draw_lines(img_in, img_out)

img_out.write("output.jpg")
