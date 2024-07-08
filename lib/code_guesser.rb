class Code_guesser
  attr_reader :is_human, :guesses, :feedbacks, :set

  def initialize(is_human)
    @is_human = is_human
    @guesses = Array.new()
    @feedbacks = Array.new()
    if !is_human
      @set = generate_set()
    end
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
      if feedbacks.length == 0
        guess = 'RRGG'
        guesses.push(guess)
        return guess
      else
        @set.select! do |possible_code|
          simulate_feedback(possible_code, guesses[-1]) == feedbacks[-1]
        end
        guess = @set[0]
        guesses.push(guess)
        return guess
      end
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

  def generate_set()
    array = ['R','G','B','Y']
    output = Array.new()

    array.each() do |a|
      array.each() do |b|
        array.each() do |c|
          array.each() do |d|
            output.push(a + b + c + d)
          end
        end
      end
    end
    # puts output
    output
  end

  def simulate_feedback(code, guess)
    white_pegs = 0 #Correct color but wrong position
    red_pegs = 0 #Correct color and correct position

    code_array = code.split('')
    guess_array = guess.split('')

    guess_array.each_with_index do |color, index|
      if code_array[index] == color && color
        red_pegs += 1
        code_array[index] = nil
        guess_array[index] = nil
      end
    end

    guess_array.each_with_index do |color, index|
      if code_array.find_index(color) && color
        white_pegs +=1
        code_array[code_array.find_index(color)] = nil
        guess_array[index] = nil
      end
    end

    return {
    :white_pegs => white_pegs,
    :red_pegs => red_pegs
    }
  end

end

# code_guesser = Code_guesser.new(false)
# puts code_guesser.guess
