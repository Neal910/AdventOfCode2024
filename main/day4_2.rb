require_relative "../util/util"

file_path = "resource/day4.txt"

def full_check(list)
  total = 0
  list.each_with_index do |line, row_index|
    line.each_with_index do |char, col_index|
      total += x_shape_check(list, row_index,col_index)
    end
  end
  puts total
end

def x_shape_check(list, row_index, col_index)
  count = 0
  if list[row_index][col_index] == "A" && row_index > 0 && col_index > 0 && row_index < list.length - 1 && col_index < list[row_index].length - 1
    if list[row_index-1][col_index-1] == "M"
        if list[row_index+1][col_index+1] == "S"
          count += 1
        end
    end

    if list[row_index+1][col_index+1] == "M"
        if list[row_index-1][col_index-1] == "S"
          count += 1
        end
    end

    if list[row_index-1][col_index+1] == "M"
        if list[row_index+1][col_index-1] == "S"
          count += 1
        end
    end

    if list[row_index+1][col_index-1] == "M"
        if list[row_index-1][col_index+1] == "S"
          count += 1
        end
    end
  end
  if count > 1
    return 1
  end
  0
end

full_check(Util.parse_characters_to_2d_array(file_path))
