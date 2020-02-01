def my_reject(arr, &prc)
  array = []
  arr.each do |el|
    array << el if !prc.call(el)
  end
  array
end

def my_one?(arr, &prc)
  count = 0
  arr.each do |el|
    count += 1 if prc.call(el)
  end
  count == 1
end

def hash_select(hash, &prc)
  new_hash = {}
  hash.each do |k,v|
    new_hash[k] = v if prc.call(k,v)
  end
  new_hash
end

def xor_select(array, prc1, prc2)
  arr = []
  array.each do |el|
    if (prc1.call(el) && !prc2.call(el)) || (!prc1.call(el) && prc2.call(el))
      arr << el
    end
  end
  arr
end

def proc_count(val, array)
  count = 0
  array.each do |prc|
    count += 1 if prc.call(val)
  end
  count
end