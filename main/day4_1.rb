require_relative "../util/util"

file_path = "resource/day4.txt"

def full_check(list)
  total = 0
  list.each_with_index do |line, row_index|
    line.each_with_index do |char, col_index|
      total += horizontal_check(line,col_index)
      total += vertical_check(list, row_index,col_index)
      total += diagonal_check(list, row_index,col_index)
    end
  end
  puts total
end

def diagonal_check(list, row_index, col_index)
  count = 0
  if list[row_index][col_index] == "X" && row_index > 2 && col_index > 2
    if list[row_index-1][col_index-1] == "M"
      if list[row_index-2][col_index-2] == "A"
        if list[row_index-3][col_index-3] == "S"
          count += 1
        end
      end
    end
  end
  if list[row_index][col_index] == "X" && row_index < list.length - 3 && col_index < list[row_index].length - 3
    if list[row_index+1][col_index+1] == "M"
      if list[row_index+2][col_index+2] == "A"
        if list[row_index+3][col_index+3] == "S"
          count += 1
        end
      end
    end
  end
  if list[row_index][col_index] == "X" && row_index > 2 && col_index < list[row_index].length - 3
    if list[row_index-1][col_index+1] == "M"
      if list[row_index-2][col_index+2] == "A"
        if list[row_index-3][col_index+3] == "S"
          count += 1
        end
      end
    end
  end
  if list[row_index][col_index] == "X" && row_index < list.length - 3 && col_index > 2
    if list[row_index+1][col_index-1] == "M"
      if list[row_index+2][col_index-2] == "A"
        if list[row_index+3][col_index-3] == "S"
          count += 1
        end
      end
    end
  end
  count
end

def vertical_check(list, row_index, col_index)
  count = 0
  if list[row_index][col_index] == "X" && row_index > 2
    if list[row_index-1][col_index] == "M"
      if list[row_index-2][col_index] == "A"
        if list[row_index-3][col_index] == "S"
          count += 1
        end
      end
    end
  end
  if list[row_index][col_index] == "X" && row_index < list.length - 3
    if list[row_index+1][col_index] == "M"
      if list[row_index+2][col_index] == "A"
        if list[row_index+3][col_index] == "S"
          count += 1
        end
      end
    end
  end
  count
end

def horizontal_check(line,col_index)
  count = 0
  if line[col_index] == "X" && col_index > 2 # go left check
    if line[col_index-1] == "M"
      if line[col_index-2] == "A"
        if line[col_index-3] == "S"
          count += 1
        end
      end
    end
  end
  if line[col_index] == "X" && col_index < line.length - 3 # go right check
    if line[col_index+1] == "M"
      if line[col_index+2] == "A"
        if line[col_index+3] == "S"
          count += 1
        end
      end
    end
  end
  count
end

full_check(Util.parse_letters_to_2d_array(file_path))
