def palindrome?(str)
  return true if str.length < 3
  (0... (str.length/2)).each do |i|
    return false if str[i] != str[-(i+1)]
  end
  true
end

def substrings(str)
  array = []
  (0..str.size-1).each do |i|
    j = str.size
    while j - i > 0
      array << str.slice(i, j - i)
      j -= 1
    end
  end
  array
end

def palindrome_substrings(str)
  substrings(str).select { |el| palindrome?(el) && el.length > 2 }
end