# Phase 1
def duos(string)
  count = 0
  string.each_char.with_index do |char, idx|
    count += 1 if string[idx+1] == char
  end
  count
end

def sentence_swap(sent, hash)
  sent.split.map do |word|
    hash[word] ? hash[word] : word
  end.join(' ')
end

def hash_mapped(hash, prc, &prc2)
  result = {}
  hash.each do |k,v|
    result[prc2.call(k)] = prc.call(v)
  end
  result
end

def counted_characters(str)
  result = []
  str.each_char do |char|
    if str.count(char) > 2 && !result.include?(char)
      result << char
    end
  end
  result
end

def triplet_true?(str)
  str.chars.each_with_index do |char, idx|
    return true if char == str[idx+1] && char == str[idx+2]
  end
  false
end

def energetic_encoding(str, hash)
  str.chars.map do |char|
    if hash[char]
      hash[char]
    elsif char == ' '
      ' '
    else
      '?'
    end
  end.join
end

def uncompress(str)
  result = ''
  (0...str.length-1).step(2).each do |i|
    str[i+1].to_i.times { result << str[i] }
  end
  result
end

# Phase 2
def conjunct_select(array, *prcs)
  array.select { |el| prcs.all? { |prc| prc.call(el) } }
end

=begin
1) word.length < 3 are unchanged
2) word.length >= 3 
begin with vowel = 'yay' to end of word
no vowel = first vowel to front of word and add 'ay'
keep capitalizations
=end

def convert_pig_latin(sent)
  result = []
  vowels = 'aeiouAEIOU'
  sent.split.each do |word|
    if word.size < 3
      result << word
    elsif vowels.include?(word[0])
      result << word + 'yay'
    else
      word.each_char.with_index do |char, idx|
        if vowels.include?(char)
          if word == word.capitalize
            result << (word[idx..-1] + word[0...idx] + 'ay').capitalize
          else
            result << word[idx..-1] + word[0...idx] + 'ay'
          end
          break
        end
      end
    end
  end
  result.join(' ')
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"