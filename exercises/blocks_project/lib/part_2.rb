def all_words_capitalized?(arr)
  arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr)
  arr.none? { |str| is_valid?(str) }
end

def is_valid?(str)
  site = ['.com', '.net', '.io', '.org']
  site.any? { |ref| str.include?(ref) }
end

def any_passing_students?(arr)
  arr.any? { |student| (student[:grades].reduce(:+) / student[:grades].size) >= 75 }
end