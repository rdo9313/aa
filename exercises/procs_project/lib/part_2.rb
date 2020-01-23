def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(sent, &prc)
  sent.split(' ').map { |word| prc.call(word) }.join(' ')
end

def greater_proc_value(num, prc1, prc2)
  return prc1.call(num) >= prc2.call(num) ? prc1.call(num) : prc2.call(num)
end

def and_selector(arr, prc1, prc2)
  result = []
  arr.each do |el|
    result << el if prc1.call(el) && prc2.call(el)
  end
  result
end

def alternating_mapper(arr, prc1, prc2)
  result = []
  arr.each_with_index do |el, idx|
    value = idx.even? ? prc1.call(el) : prc2.call(el)
    result << value
  end
  result
end