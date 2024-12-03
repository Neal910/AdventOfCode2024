require_relative "../util/util"

file_path = "resource/day1.txt"

def read_file_into_two_lists(file_path)
  first_numbers = []
  second_numbers = []

  numbers = Util.read_file(file_path)
  numbers.each do |n|
    first_numbers << n[0]
    second_numbers << n[1]
  end

  [first_numbers, second_numbers]
end

def find_similarity(list1, list2)
  similarity = 0
  (0...list1.length).each do |i|
    similarity += list1[i] * list2.count(list1[i])
  end
  similarity
end

def find_total_distance(first_numbers, second_numbers)
  total_distance = 0

  list1 = first_numbers.sort
  list2 = second_numbers.sort
  (0...list1.length).each do |i|
    total_distance += (list1[i] - list2[i]).abs
  end

  total_distance
end

puts find_similarity(*read_file_into_two_lists(file_path))
