def no_dupes?(arr)
  hash = Hash.new(0)
  arr.each do |el|
    hash[el] += 1
  end
  result = []
  hash.each do |k,v|
    result << k if v == 1
  end
  result
end
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
  (arr.length-1).times do |i|
    return false if arr[i] == arr[i+1]
  end
  true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  hash = Hash.new { |h,k| h[k] = [] }
  str.chars.each_with_index do |char, idx|
    hash[char] << idx
  end
  hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  current = ''
  longest = ''

  (0...str.length).each  do |i|
    if str[i] == str[i-1] || i == 0
      current += str[i]
    else
      current = str[i]
    end

    if current.length >= longest.length
      longest = current
    end
  end
  longest
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'
def prime?(num)
  return true if num < 3

  (2...num).each do |i|
    return false if num % i == 0
  end
  true
end

def factors(num)
  array = []
  (2..(num/2)).each do |i|
    array << i if num % i == 0
  end
  array
end

def bi_prime?(num)
  products = []
  divisors = factors(num)
  (0...divisors.length).each do |i|
    (i...divisors.length).each do |j|
      products << [divisors[i],divisors[j]] if divisors[i] * divisors[j] == num
    end
  end
  products.any? { |sub| prime?(sub[0]) && prime?(sub[1]) }
end


# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str, arr)
  alpha = ('a'..'z').to_a
  new_msg = ''

  str.each_char.with_index do |char,idx|
    old_pos = alpha.index(char)
    new_pos = old_pos + arr[idx % arr.length]
    new_msg += alpha[new_pos % 26]
  end
  new_msg
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
  vowels = ['a','e','i','o','u']
  str.each_char do |char|
    
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"