class Code_maker
  attr_accessor :is_human
  attr_reader :code

  def initialize(is_human)
    @is_human = is_human
  end

  def generate_code()
    if is_human
      puts "\nPlease enter the 4 color code as a sequence of colour characters - RGBY. For example 'RRBY'"
      @code = gets.chomp

      if !is_code_valid(@code)
        puts "\nCode invalid, pls try again"
        return self.generate_code()
      end

      puts "\nYour code is #{@code}"
      return @code
    else
      @code = random_code()
      puts "\nCode Generated!"
      return @code
    end
  end

  def give_feedback(guess)
    white_pegs = 0 #Correct color but wrong position
    red_pegs = 0 #Correct color and correct position

    code_array = @code.split('')
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
      white_pegs: white_pegs,
      red_pegs: red_pegs
    }

  end

  ## Helper Methods
  def is_code_valid(code)
    if code.length != 4
      return false
    end

    code.split('').each do |char|
      if !('RGBY'.include? char)
        return false
      end
    end

    true
  end

  def random_code
    code = ""

    for i in 1..4
      n = rand(1..4)

      case n
        when 1
          code += 'R'
        when 2
          code += 'G'
        when 3
          code += 'B'
        when 4
          code += 'Y'
      end

    end

    return code
  end

end

# code_maker = Code_maker.new(true)
# # code_maker.generate_code()
# puts code_maker.give_feedback('RRYY')
# puts code_maker.random_code
