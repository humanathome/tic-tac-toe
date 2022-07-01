# frozen_string_literal: true

# player class
class Player
  attr_accessor :name
  attr_reader :symbol

  def initialize(name, symbol)
    @name = name.capitalize
    @symbol = symbol
  end

  def player_input_valid?(input)
    input.is_a?(Integer) && input.between?(1, 9)
  end
end
