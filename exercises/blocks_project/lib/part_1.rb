def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |el| el["age"] < 3 }
end

def count_positive_subarrays(arr)
  arr.count do |sub|
    sub.reduce(:+) > 0
  end
end

def aba_translate(word)
  vowels = 'aeiou'
  array = []

  word.chars.each do |char|
    if vowels.include?(char)
      array << char + "b" + char
    else
      array << char
    end
  end
  array.join
end

def aba_array(arr)
  arr.map { |word| aba_translate(word) }
end