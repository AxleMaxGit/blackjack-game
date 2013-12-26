
class Hand

  attr_accessor :cards

  def initialize(deck)
    @cards = [] 
    self.cards = (0..1).to_a.map { |id| deck.cards.pop }
  end
end