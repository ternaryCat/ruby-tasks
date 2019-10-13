def sort(array)
  array.sort { |number1, number2| compare_numbers(number1, number2) }
end

def compare_numbers(number1, number2)
  comparation_result = count_one_numbers(number1) <=> count_one_numbers(number2)
  return comparation_result if comparation_result.nonzero?

  number1 <=> number2
end

def count_one_numbers(number)
  format('%b', number).count('1')
end
