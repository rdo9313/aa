require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    board.place_random_ships
    puts "The number of ships placed on the board is #{board.num_ships}."
    board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'you lose'
      true
    else
      false
    end
  end

  def win?
    if board.num_ships == 0
      puts 'you win'
      true
    else
      false
    end
  end

  def game_over?
    win? || lose?
  end

  def turn
    move = player.get_move
    if !board.attack(move)
      @remaining_misses -= 1
    end
    board.print
    puts "You have #{@remaining_misses} left."
  end
end