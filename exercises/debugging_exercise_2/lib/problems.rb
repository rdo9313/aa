# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  return num if prime?(num)
  largest = 0

  (2..num-1).each do |i|
    largest = i if num % i == 0 && prime?(i)
  end
  largest
end

def prime?(num)
  return true if num < 3

  (2..num-1).each do |i|
    return false if num % i == 0
  end
  true
end

def unique_chars?(str)
  str.each_char do |char|
    return false if str.count(char) > 1
  end
  true
end

=begin
1) iterate through array and check if element is duplicate
2) find indexes of element using each_with_index
3) push el and values into hash
=end
def dupe_indices(arr)
  indices = Hash.new { |h,k| h[k] = [] }

  arr.each_with_index do |val, idx|
    if arr.count(val) > 1
      indices[val] << idx
    end
  end
  indices
end

def ana_array(arr1, arr2)
  max = (arr1.size >= arr2.size) ? arr1 : arr2

  max.each do |el|
    return false if arr1.count(el) != arr2.count(el)
  end
  true
end