def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(array)
  array.reduce(:+) / array.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sent)
  arr = []
  sent.split(" ").each_with_index do |el, i|
     arr << (i.even? ? el.upcase : el.downcase)
  end
  arr.join(" ")
end