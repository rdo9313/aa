# Phase 1
def strange_sums(array)
  count = 0
  (0...array.length-1).each do |i|
    (i+1...array.length).each do |j|
      count += 1 if array[i] + array[j] == 0
    end
  end
  count
end

def pair_product(array, product)
  (0...array.length-1).each do |i|
    (i+1...array.length).each do |j|
      return true if array[i] * array[j] == product
    end
  end
  false
end

def rampant_repeats(str, hash)
  result = ''
  str.each_char do |char|
    if hash[char]
      result += char * hash[char]
    else
      result += char
    end
  end
  result
end

def perfect_square(num)
  i = 1
  while i**2 <= num
    return true if i**2 == num
    i += 1
  end
  false
end

# Phase 2
def count_divisors(num)
  count = 0
  (1...num).each do |n|
    count += 1 if num % n == 0
  end
  count
end

def anti_prime?(num)
  (1..num).max { |a,b| count_divisors(a) <=> count_divisors(b) } == num
end

def matrix_addition(matrix_a, matrix_b)
  a = matrix_a.length
  b = matrix_a[0].length
  result = Array.new(a) { Array.new(b) }
  (0...a).each do |i|
    (0...b).each do |j|
      result[i][j] = matrix_a[i][j] + matrix_b[i][j]
    end
  end
  result
end

def divisors(num)
  divisors = []
  (1..num).each do |n|
    divisors << n if num % n == 0
  end
  divisors
end

def mutual_factors(*nums)
  result = []
  nums.each do |num|
    result += divisors(num)
  end
  result.select { |i| result.count(i) == nums.length }.uniq
end

def tribonacci_number(num)
  return 1 if num < 3
  return 2 if num == 3
  tribonacci_number(num-1) + tribonacci_number(num-2) + tribonacci_number(num-3)
end

# Phase 3
def matrix_addition_reloaded(*matrices)
  a = matrices.first.length
  b = matrices.first.first.length
  matrices.each do |matrix|
    return nil if a != matrix.length
  end
  result = Array.new(a) { [0] * b }
  matrices.reduce(result) do |m1, m2|
    matrix_addition(m1, m2)
  end
end

def squarocol?(array)
  size = array[0].length
  new_array = Array.new(size) { Array.new(size) }
  (0...size).each do |i|
    (0...size).each do |j|
      new_array[i][j] = array[j][i]
    end
  end
  array.each do |sub|
    return true if sub.uniq.size == 1
  end

  new_array.each do |sub|
    return true if sub.uniq.size == 1
  end
  false
end

def squaragonal?(array)
  size = array.length - 1
  arr1 = []
  arr2 = []
  (0..size).each do |i|
    arr1 << array[i][i]
  end
  (0..size).each do |i|
    arr2 << array[i][size-i]
  end
  arr1.uniq.size == 1 || arr2.uniq.size == 1
end

def add_adjacent(array)
  sums = []
  (0...array.length-1).each do |i|
    sums << array[i] + array[i+1]
  end
  sums
end

def pascals_triangle(n)
  array = [[1]]
  while array.length < n
    level_above = array.last
    current_level = [1]
    current_level += add_adjacent(level_above)
    current_level << 1
    array << current_level
  end
  array
end

# Phase 4
def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
  true
end

def mersenne_prime(n)
  count = 0
  i = 2
  while count < n
    result = 2**i - 1
    count += 1 if prime?(result) 
    break if count == n
    i += 1
  end
  result
end

def encode(string)
  alpha = ('a'..'z').to_a
  sum = 0
  string.each_char do |char|
    sum += alpha.index(char)
  end
  sum + string.length
end

def triangular_word?(string)
  i = 1
  while (i*(i+1))/2 < encode(string)
    i += 1
  end
  (i*(i+1))/2 == encode(string)
end

def consecutive?(a,b)
  (a + 1 == b) || (a - 1 == b)
end

def consecutive_collapse(array)
  clean = false
  while !clean
    clean = true
    array.each_with_index do |n, idx|
      if consecutive?(n, array[idx+1])
        array = array[0,idx] + array[idx+2..-1]
        clean = false
        break
      end
    end
  end
  array
end

def find_prime(num, n)
  count = 0
  if n > 0
    while count < n
      num += 1
      count += 1 if prime?(num)
    end
  else
    while count < n.abs
      return nil if num == 2
      num -= 1
      count += 1 if prime?(num)
    end
  end
  num
end

def pretentious_primes(array, n)
  result = []
  array.each do |i|
    result << find_prime(i, n)
  end
  result
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]