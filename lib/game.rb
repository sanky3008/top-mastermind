class Game
  attr_accessor :tries, :code_maker, :code_guesser

  def initialize(is_codemaker_human, is_codeguesser_human)
    @tries = 12
    @code_maker = Code_maker.new(is_codemaker_human)
    @code_guesser = Code_guesser.new(is_codeguesser_human)
  end

  def play_game
    @code_maker.generate_code

    for i in 0..12

      puts "\n\nTurn number #{i}"

      guess = @code_guesser.guess
      feedback = @code_maker.give_feedback(guess)

      puts "Your feedback is as follows:"
      puts feedback

      @code_guesser.get_feedback(feedback)

      if game_over?(feedback)

        puts "\nYou won! Correct guess!"
        return
      end

    end

    puts "\nYou lost :( Correct code was #{code_maker.code}"
  end

  # Helper functions
  def game_over?(feedback)
    if feedback[:red_pegs] == 4
      return true
    end

    return false
  end
end
