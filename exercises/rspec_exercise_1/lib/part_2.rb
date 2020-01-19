def hipsterfy(word)
  vowel = 'aeiou'
  vowel_idx = nil
  (0..word.size-1).each do |i|
    if vowel.include?(word[i])
      vowel_idx = i
    end
  end
  if vowel_idx
    word[0...vowel_idx] + word[vowel_idx+1..-1]
  else
    word
  end
end

def vowel_counts(str)
  vowels = ['a','e','i','o','u']
  hash = {}
  vowels.each do |vowel|
    hash[vowel] = str.downcase.count(vowel)
  end
  hash
end
=begin
1) iterate through msg and check if char in alphabet
2) if char in alphabet, find index, then add n
3) if over 26, go back to 0
4) push new char into new array 
5) return joined array
=end
def caesar_cipher(msg, n)
  alphabet = ('a'..'z').to_a
  array = []
  msg.chars.each do |char|
    if alphabet.include?(char)
      index = (alphabet.index(char) + n) % 26
      array << alphabet[index]
    else
      array << char
    end
  end
  array.join("")
end