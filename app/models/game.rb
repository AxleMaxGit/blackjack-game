#require 'deck.rb'
#require 'player.rb'

class Game
  attr_accessor :players, :deck

  def initialize
    @players = []
    @deck = Deck.new
  end

  def deal(deck)
    self.players.each do |player|
      player.get_hand(deck)
    end
  end

end