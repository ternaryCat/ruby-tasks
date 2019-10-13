def max_multiplication(str)
  combinations = find_numbers_combinations(str)
  return unless combinations

  combinations.map { |combination| multiply_all_numbers_combinations(combination) }.max
end

def find_numbers_combinations(str, length = 4)
  combinations = str.scan %r{\d{#{length},}}
  return if combinations.empty?

  combinations.each do |combination|
    break if combination.size <= length

    combinations += split_numbers_combination(combination, length)
    combinations.delete combination
  end
  combinations
end

def split_numbers_combination(combination, length)
  result = []
  (combination.size - length + 1).times do |time|
    result.append(combination.slice(time, length))
  end
  result
end

def multiply_all_numbers_combinations(str)
  result = 1
  str.each_char do |number|
    result *= number.to_i
  end
  result
end
