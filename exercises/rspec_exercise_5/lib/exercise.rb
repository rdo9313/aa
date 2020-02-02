def zip(*arrays)
  length = arrays.first.length

  (0...length).map do |i|
      arrays.map { |array| array[i] }
  end
end

def prizz_proc(arr, prc1, prc2)
  result = []
  arr.each do |el|
    result << el if (prc1.call(el) && !prc2.call(el)) || (!prc1.call(el) && prc2.call(el))
  end
  result
end

def zany_zip(*arrays)
  length = arrays.max { |a, b| a.length <=> b.length }.length

  (0...length).map do |i|
    arrays.map { |array| array[i] ? array[i] : nil }
  end
end

def maximum(arr, &prc)
  return nil if arr.empty?
  max = arr.first
  arr.each do |el|
    max = el if prc.call(el) >= prc.call(max)
  end
  max
end

def my_group_by(arr, &prc)
  new_hash = Hash.new { |h,k| h[k] = [] }
  arr.each do |el|
    new_hash[prc.call(el)] << el
  end
  new_hash
end

def max_tie_breaker(array, tie_breaker, &prc)
    return nil if array.empty?
    max = array.first
    array.each do |el|
        result_el = prc.call(el)
        result_max = prc.call(max)
        if result_el > result_max
            max = el
        elsif result_el == result_max && tie_breaker.call(el) > tie_breaker.call(max)
            max = el
        end
    end
    max
end

def silly_syllables(sent)
  vowels = 'aeiou'
  new_sent = []
  sent.split.each do |word|
    collection = []
    word.each_char.with_index do |char, idx|
      collection << idx if vowels.include?(char)
    end
    if collection.length < 2
      new_sent << word
    else
      new_sent << word[collection.first..collection.last]
    end
  end
  new_sent.join(' ')
end