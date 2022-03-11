class Game
  def initialize
    @players = [Player.new("Player 1", "P1"), Player.new("Player 2", "P2")]
    @turn = 0
  end

  def get_scores
    "#{@players[0].short_name}: #{@players[0].current_lives}/#{@players[0].max_lives} vs #{@players[1].short_name}: #{@players[1].current_lives}/#{@players[1].max_lives}"
  end

  def switch_turn
    @turn = (@turn + 1) % @players.length()
    @players[@turn]
  end

  def game_end
    @players.each do |player|
      if player.current_lives <= 0
        return true
      end
    end
    false
  end

  def start
    current_player = @players[@turn]
    while !self.game_end
      current_question = Question.new
      puts "#{current_player.name}: #{current_question}"
      user_answer = gets.chomp.to_i
      if current_question.check_answer(user_answer)
        puts "#{current_player.name}: YES! You are correct. "
      else
        current_player.deduct_life
        puts "#{current_player.name}: Seriously? No! "
      end
      puts self.get_scores
      current_player = self.switch_turn
    end
    puts "#{current_player.name} wins with a score of #{current_player.current_lives}/#{current_player.max_lives}"
    puts "Good bye!"
  end
end