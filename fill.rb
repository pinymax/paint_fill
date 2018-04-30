require 'pp'

def fill(screen, x, y, color)
  pp "Coordinates outside the image area" and return if coordinates_is_out_of_pictures_range(screen, x, y)
  basecolor = screen[y][x]
  fill_adjacent_pixels(screen, x, y, color, basecolor)
  pp screen
end

def fill_adjacent_pixels(screen, x, y, color, basecolor)
  screen[y][x] = color
  if (screen[y][x - 1] == basecolor) && (x != 0)
    fill_adjacent_pixels(screen, x - 1, y, color, basecolor)
  end
  if (screen[y - 1][x] == basecolor) && (y != 0)
    fill_adjacent_pixels(screen, x, y - 1, color, basecolor)
  end
  if (x != screen[y].size - 1) && (screen[y][x + 1] == basecolor)
    fill_adjacent_pixels(screen, x + 1, y, color, basecolor)
  end
  if (y != screen.size - 1) && (screen[y + 1][x] == basecolor)
    fill_adjacent_pixels(screen, x, y + 1, color, basecolor)
  end
end

def coordinates_is_out_of_pictures_range(screen, x, y)
  x < 0 || x >= screen[0].size || y < 0 || y >= screen.size
end

picture = [[0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0],
           [0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
           [0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
           [0, 4, 0, 0, 0, 2, 7, 7, 7, 7, 7, 7, 1],
           [0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 1],
           [0, 4, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1],
           [0, 0, 3, 3, 3, 1, 0, 0, 0, 0, 0, 0, 1],
           [0, 0, 0, 0, 8, 1, 1, 1, 1, 1, 1, 1, 1]]


picture0 = [[0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

fill(picture, 0, 0, 9)
# fill(picture0, 2, 0, 4)
