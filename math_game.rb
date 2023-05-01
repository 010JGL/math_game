require './player'
require './question'

class Math_game 
  attr_accessor :first, :second, :current_player, :current_question
  
  def initialize(name1, name2)
    # initialize players gotta pass a string
    @first = Player.new(name1)
    @second = Player.new(name2)
    @current_player = first
    @current_question = ""
  end

  def turn
    if @second.lives == 0
      
      puts "Player 1 wins with a score of #{@first.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    end
    if @first.lives == 0 
      puts "Player 2 wins with a score of #{@second.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      exit(0)
    end
    #check if users have lives remaining  
    if @first.lives && @second.lives > 0
      
      # if yes display new question
      @current_question = Question.new
      # call the questions
      @current_question.say_question
      # need to put input inside the function so it doesnt fuck with the puts
      @input = gets.chomp.to_i
      validate(@input)
    #if no display end game + good bye
  end
  end
  
  
  def show_score
    puts "P1: #{@first.lives}/3 vs P2: #{@second.lives}/3"
  end

  def change_turn
    if @current_player == first
      @current_player = second
    else
      @current_player = first
    end
  end
    
  
  
  def validate(input)
    if current_question.validate(@input) == true
      # if answer right display congrats
      puts "YES! You are correct."
      # + show score
      show_score
      # + change player turn
      change_turn
      turn
    else
      # if answer wrong display error message 
      puts "Seriously? No!"
      # + remove life
      current_player.remove_life
      # + show score
      show_score
      # + change player turn
      change_turn
      turn
    end
  end
    

end




