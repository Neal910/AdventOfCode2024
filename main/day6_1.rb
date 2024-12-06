require_relative "../util/util"

file_path = "resource/day6.txt"
file_output = "resource/day6_visited.txt"

$list = Util.parse_characters_to_2d_array(file_path)

def locate_start_point()
  $list.each_with_index do |line, row_index|
    line.each_with_index do |char, col_index|
      if char == "^"
        return [row_index, col_index]
      end
    end
  end
  nil
end

def walk(start_point)
  directions = "up"
  row, col = start_point
  while row < $list.length && col < $list[0].length && row >= 0 && col >= 0
    case directions
    when "up"
      if row - 1 < 0
        break
      end
      if $list[row-1][col] == "#"
        directions = "right"
      else
        step(row-1, col)
        row -= 1
      end
    when "right"
      if col+1 >= $list[0].length
        break
      end
      if $list[row][col+1] == "#"
        directions = "down"
      else
        step(row, col+1)
        col += 1
      end
    when "down"
      if row+1 >= $list.length
        break
      end
      if $list[row+1][col] == "#"
        directions = "left"
      else
        step(row+1, col)
        row += 1
      end
    when "left"
      if col-1 < 0
        break
      end
      if $list[row][col-1] == "#"
        directions = "up"
      else
        step(row, col-1)
        col -= 1
      end
    end
  end
end


def step(row, col)
  $list[row][col] = "*"
end

def counting_stars()
  count = 0
  $list.each do |line|
    line.each do |char|
      if char == "*"
        count += 1
      end
    end
  end
  count
end

def write_2d_list_to_file(list, file_path)
  File.open(file_path, "w") do |file|
    list.each do |row|
      file.puts row.join("") # Join elements of the row with a space and write to the file
    end
  end
end

def main(file_path, file_output)
  start_point = locate_start_point()
  walk(start_point)
  puts counting_stars()+1 # +1 because the starting point is also a star
  write_2d_list_to_file($list, file_output)
end

main(file_path, file_output)
