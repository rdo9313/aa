class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = self.class.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    self.attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    array = []
    @secret_word.chars.each_with_index do |x, i|
      array << i if x == char
    end
    array
  end

  def fill_indices(char, array)
    array.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if !@secret_word.include?(char) 
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, self.get_matching_indices(char))
      end
    
    if already_attempted?(char)
      puts 'that has already been attempted'
      false
    else
      self.attempted_chars << char
      true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose? 
      puts @secret_word
      true
    else
      false
    end
  end
end
