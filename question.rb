require './math_game'

class Question
  
  attr_accessor :number1, :number2, :answer

  def initialize
    # numbers for the question
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def say_question 
    #display question
    puts "#{@current_player} What does #{@number1} + #{@number2} equal?"

  end

  # validate answer
  def validate(input)
    if @answer != input
      false
    else 
      true
    end
  end
  
  
end


