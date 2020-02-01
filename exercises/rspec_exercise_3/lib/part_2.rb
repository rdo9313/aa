def element_count(array)
  hash = Hash.new(0)

  array.each do |el|
    hash[el] += 1
  end
  hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |char, idx|
    str[idx] = hash[char] if hash[char] 
  end
  str
end

def product_inject(array)
  array.inject(:*)
end