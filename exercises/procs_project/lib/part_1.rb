def my_map(arr, &prc)
  new_arr = []
  arr.each { |el| new_arr << prc.call(el)}
  new_arr
end

def my_select(arr, &prc)
  new_arr = []
  arr.each { |el| new_arr << el if prc.call(el)}
  new_arr
end

def my_count(arr, &prc)
  count = 0
  arr.each { |el| count += 1 if prc.call(el) }
  count
end

def my_any?(arr, &prc)
  result = false
  arr.each { |el| result = true if prc.call(el) }
  result
end

def my_all?(arr, &prc)
  result = true
  arr.each { |el| result = false if !prc.call(el) }
  result
end

def my_none?(arr, &prc)
  result = true
  arr.each { |el| result = false if prc.call(el) }
  result
end