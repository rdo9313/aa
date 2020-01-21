def partition(arr, num)
  lesser = arr.select { |i| i < num }
  greater = arr.select { |i| i >= num }
  [lesser, greater]
end

def merge(hash_1, hash_2) 
  new_hash = {}
  hash_1.each { |k,v| new_hash[k] = v }
  hash_2.each { |k,v| new_hash[k] = v }
  new_hash
end

def censor(sent, arr)
  array = []
  sent.split(" ").each do |word|
    if arr.include?(word.downcase)
      array << word.gsub(/[aeiouAEIOU]/, '*')
    else
      array << word
    end
  end
  array.join(" ")
end

def power_of_two?(num)
  product = 1
  while product <= num
    return true if product == num
    product *= 2
  end
  false
end

