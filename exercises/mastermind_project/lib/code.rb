class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |el| POSSIBLE_PEGS.has_key?(el.upcase) }
  end

  def self.random(length)
    self.new(Array.new(length, POSSIBLE_PEGS.keys.sample))
  end

  def self.from_string(string)
    self.new(string.chars.map(&:upcase))
  end

  def initialize(arr)
    if self.class.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise ArgumentError
    end
  end

  def [](index)
    self.pegs[index]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(code)
    exact = 0
    (0...code.length).each do |i|
      exact += 1 if code[i] == self[i]
    end
    exact
  end

  def num_near_matches(code)
    near = 0
    (0...code.length).each do |i|
      if code[i] != self[i] && self.pegs.include?(code[i])
        near += 1
      end
    end
    near
  end

  def ==(code)
    self.pegs == code.pegs
  end
end
