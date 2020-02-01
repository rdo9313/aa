def proper_factors(num)
  (1...num).select { |n| num % n == 0 }
end

def aliquot_sum(num)
  proper_factors(num).reduce(:+)
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(n)
  array = []
  count = 0
  i = 1
  while count < n
    if perfect_number?(i)
      count += 1
      array << i
    end
    i += 1
  end
  array
end