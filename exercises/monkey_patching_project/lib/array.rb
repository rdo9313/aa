# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.reduce(:+) / self.size.to_f
  end

  def median
    return nil if self.empty?
    mid = self.size / 2
    if self.size.even?
      (self.sort[mid-1] + self.sort[mid]) / 2.0
    else
      self.sort[mid]
    end
  end

  def counts
    return {} if self.empty?
    hash = {}
    self.each do |el|
      hash[el] = self.count(el)
    end
    hash
  end

  def my_count(el)
    count = 0
    self.each do |x|
      count += 1 if x == el
    end
    count 
  end

  def my_index(el)
    self.each_with_index do |x,i|
      return i if x == el
    end
    nil
  end

  def my_uniq
    array = []
    self.each do |x|
      array << x if !array.include?(x)
    end
    array
  end

  def my_transpose
    array = Array.new(self.size) { Array.new(self.size) }
    (0...self.size).each do |i|
      (0...self.size).each do |j|
        array[i][j] = self[j][i]
      end
    end
    array
  end
end
