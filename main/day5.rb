require_relative "../util/util"

rules = "resource/day5_rules.txt"
inputs = "resource/day5_update.txt"


def get_rules_list(rules)
  result = []
  File.foreach(rules) do |line|
    numbers = line.split('|').map(&:to_i)
    result << numbers
  end
  result
end

def get_inputs_list(inputs)
  result = []
  File.foreach(inputs) do |line|
    numbers = line.split(',').map(&:to_i)
    result << numbers
  end
  result
end

def follow_rules?(rules, input)
  rules.each do |rule|
    if input.index(rule[0]) == nil || input.index(rule[1]) == nil
      next
    end
    if input.index(rule[0]) > input.index(rule[1])
      return false
    end
  end
  true
end

def find_middle_number(input)
  input[(input.length-1)/2]
end

def check_rules(rules, inputs)
  total = 0
  inputs.each do |input|
    if follow_rules?(rules, input)
      total += find_middle_number(input)
    end
  end
  total
end


puts check_rules(get_rules_list(rules), get_inputs_list(inputs))
