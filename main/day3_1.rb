require_relative "../util/util"

file_path = "resource/day3.txt"

def extract_match_pattern(file_path)
  pattern = /mul\((\d+),(\d+)\)/
  total = 0

  content = File.read(file_path)

  content.scan(pattern) do |num1, num2|
    num1 = num1.to_i
    num2 = num2.to_i

    total += num1 * num2
  end
  puts total
end

extract_match_pattern(file_path)
