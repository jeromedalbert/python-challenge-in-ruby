require 'chunky_png'
include ChunkyPNG


def gray?(pixel)
  Color.r(pixel) == Color.g(pixel) && Color.g(pixel) == Color.b(pixel)
end

# Gray color is (r + g + b) / 3.
# In gray pixels, r = g = b, so we can return r or g or b
def gray_color(gray_pixel)
  Color.r(gray_pixel)
end

def first_gray_y(img)
  img.height.times.find { |y| gray?(img[0,y]) }
end


img = Image.from_file('oxygen.png')
y = first_gray_y(img)

x_array = [0] + (1...img.width).select { |x| img[x, y] != img[x-1, y] }
different_pixels = x_array.map { |x| img[x, y] }

answer = different_pixels.map { |e| gray_color(e).chr }.join  
answer = answer[/\[(.*)\]/, 1].split(", ").map { |e| e.to_i.chr }

p answer
puts 'Must guess "integrity"'