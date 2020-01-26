require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end
  
  def print_matches(code)
    puts "Number of exact matches is: #{@secret_code.num_exact_matches(code)}"
    puts "Number of near matches is: #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    puts "Enter a code:"
    guess = gets.chomp
    guess_code = Code.from_string(guess)
    self.print_matches(guess_code)
    @secret_code == guess_code
  end
end
