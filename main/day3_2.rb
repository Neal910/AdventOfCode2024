require_relative "../util/util"

file_path = "resource/day3.txt"

def parse_input_to_array(file_path)
  enabled_list = []
  enable = true

  mul_pattern = /mul\((\d+),(\d+)\)/
  disable_pattern = /don't\(\)/
  enable_pattern = /do\(\)/

  content = File.read(file_path)
  content.scan(/(mul\((\d+),(\d+)\)|don't\(\)|do\(\))/) do |match|
    case match[0]
    when mul_pattern
      if enable
        enabled_list << match[1].to_i * match[2].to_i
      end
    when enable_pattern
      enable = true
    when disable_pattern
      enable = false
    end
  end
  enabled_list
end

def total_from_list(lists)
  total = 0
  lists.each do |list|
    total += list
  end
  puts total
  total
end

total_from_list(parse_input_to_array(file_path))
