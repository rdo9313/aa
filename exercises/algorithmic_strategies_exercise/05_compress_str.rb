# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  i = 0
  count = 1
  compressed = ''
  while i < str.length
    if str[i] != str[i+1]
      compressed << "#{count}#{str[i]}"
      count = 0
    end
    count += 1
    i += 1
  end
  compressed.delete('1')
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
