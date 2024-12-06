require_relative "../util/util"

$file_path = "resource/day6_visited.txt"

def locate_start_point(list)
  list.each_with_index do |line, row_index|
    line.each_with_index do |char, col_index|
      return [row_index, col_index] if char == "^"
    end
  end
  nil
end

def walk(list,start_point)
  directions = "up"
  row, col = start_point

  while row < list.length && col < list[0].length && row >= 0 && col >= 0
    case directions
    when "up"
      if row - 1 < 0
        break
      end
      if list[row-1][col].include?("u")
        return true
      end
      if list[row-1][col] == "#"
        directions = "right"
      else
        stepUp(list,row-1, col)
        row -= 1
      end
    when "right"
      if col+1 >= list[0].length
        break
      end
      if list[row][col+1].include?("r")
        return true
      end
      if list[row][col+1] == "#"
        directions = "down"
      else
        stepRight(list,row, col+1)
        col += 1
      end
    when "down"
      if row+1 >= list.length
        break
      end
      if list[row+1][col].include?("d")
        return true
      end
      if list[row+1][col] == "#"
        directions = "left"
      else
        stepDown(list,row+1, col)
        row += 1
      end
    when "left"
      if col-1 < 0
        break
      end
      if list[row][col-1].include?("l")
        return true
      end
      if list[row][col-1] == "#"
        directions = "up"
      else
        stepLeft(list,row, col-1)
        col -= 1
      end
    end
  end
  return false
end


def stepUp(list, row, col)
  list[row][col] << "u"
end

def stepRight(list,row, col)
  list[row][col] << "r"
end

def stepDown(list,row, col)
  list[row][col] << "d"
end

def stepLeft(list,row, col)
  list[row][col] << "l"
end

def main()
  list = Util.parse_letters_to_2d_array($file_path)
  obstacle = 0
  start_point = locate_start_point(list)

  list.each_with_index do |line, row_index|
    line.each_with_index do |char, col_index|
      if char == "*"
        modified_list = Marshal.load(Marshal.dump(list))
        modified_list[row_index][col_index] = "#"
        obstacle += 1 if walk(modified_list,start_point)
      end
    end
  end
  puts obstacle
end

main()
