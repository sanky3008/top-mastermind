class Code_guesser
  attr_reader :is_human, :guesses, :feedbacks

  def initialize(is_human)
    @is_human = is_human
    @guesses = Array.new()
    @feedbacks = Array.new()
  end

  def guess
    if @is_human
      puts "\nMake a guess!"
      guess = gets.chomp

      if !is_code_valid(guess)
        puts "\nCode invalid, pls try again"
        guess = self.guess()
      end

      guesses.push(guess)
      return guess
    else
      # To be filled with strategies
    end
  end

  def get_feedback(feedback)
    @feedbacks.push(feedback)
  end


  ## Helper Methods
  def is_code_valid(guess)
    if guess.length != 4
      return false
    end

    guess.split('').each do |char|
      if !('RGBY'.include? char)
        return false
      end
    end

    true
  end

end

# code_guesser = Code_guesser.new(true)
# puts code_guesser.guess
