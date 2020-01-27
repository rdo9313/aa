class Board
  attr_reader :size, :grid
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](array)
    grid[array[0]][array[1]]
  end

  def []=(pos, value)
    grid[pos[0]][pos[1]] = value
  end

  def num_ships
    grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    ship_count = @size / 4
    while self.num_ships < ship_count
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      self[[rand_row, rand_col]] = :S
    end
  end

  def hidden_ships_grid
    grid.map do |row|
      row.map do |el|
        if el == :S
          :N
        else
          el
        end
      end
    end
  end

  def self.print_grid(array)
    array.each do |row|
      puts row.join(' ')
    end
  end

  def cheat
    self.class.print_grid(@grid)
  end

  def print
    self.class.print_grid(self.hidden_ships_grid)
  end
end
