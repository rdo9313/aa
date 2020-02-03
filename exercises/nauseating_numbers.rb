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
  result = Array.new(a) { Array.new(b) }

end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]
p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil