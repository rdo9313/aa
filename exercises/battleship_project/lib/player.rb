class Player
  def get_move
    puts 'enter a position with coordinates separated with a space like `4 7`'
    move = gets.chomp
    move_array = move.split(' ').map(&:to_i)
    [move_array[0], move_array[1]]
  end
end
