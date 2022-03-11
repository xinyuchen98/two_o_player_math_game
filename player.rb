class Player
  attr_reader :name, :short_name, :max_lives, :current_lives

  def initialize(name, short_name)
    @name = name
    @short_name = short_name
    @max_lives = 3
    @current_lives = 3
  end

  def deduct_life
    @current_lives -= 1
  end

end