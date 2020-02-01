def is_prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if num % i == 0
  end
  true
end

def nth_prime(n)
  count = 0
  i = 2
  while count < n
    x = i
    count += 1 if is_prime?(x)
    i += 1
  end
  x
end

def prime_range(min, max)
  array = []
  (min..max).each do |i|
    array << i if is_prime?(i)
  end
  array
end