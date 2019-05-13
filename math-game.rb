  class Player
    attr_accessor :lives
    def initialize()
      @lives = 3
    end
  end

  class Game
    attr_accessor :gameover, :currentPlayer
    def initialize()
      @gameover = false
      @currentPlayer = 1
    end
  end

  class Question
    attr_reader :numberone, :numbertwo
    def questionGenerator()
      selectednum = []
      inputarr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
      selectednum.push(inputarr.sample)
      selectednum.push(inputarr.sample)
    end
  end

q1 = Question.new()
game = Game.new()
player1 = Player.new()
player2 = Player.new()

until game.gameover do

  firstnumber = q1.questionGenerator[0]
  secondnumber = q1.questionGenerator[1]

  actualsum = firstnumber + secondnumber

  puts "Player #{game.currentPlayer}: What does #{firstnumber} + #{secondnumber} equal?"
  playerinput = gets.chomp

  if (playerinput.to_i == actualsum.to_i)
    puts "Player #{game.currentPlayer}: YES! You are correct"
    puts "P1: #{player1.lives}/3 VS P2: #{player2.lives}/3"
  else
    puts "Player #{game.currentPlayer}: Seriously? No!"
    if game.currentPlayer == 1
      player1.lives -= 1
    elsif game.currentPlayer == 2
      player2.lives -= 1
    end
    puts "P1: #{player1.lives}/3 VS P2: #{player2.lives}/3"
  end

  if player1.lives == 0 || player2.lives == 0
    game.gameover = true
    if player1.lives == 0
      puts "Player 2 wins with a score of #{player2.lives}/3"
    else
      puts "Player 1 wins with a score of #{player1.lives}/3"
    end
  end

  if game.currentPlayer == 1
    game.currentPlayer = 2
  else
    game.currentPlayer = 1
  end

end
