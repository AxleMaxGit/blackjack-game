require './card.rb'

DECKSIZE = 52

class Deck

  attr_accessor :cards

  def initialize
    puts "\n"
    # shuffle array and init each Card
    puts "Creating & Shuffling the Deck ... \n\n"
    self.cards = (0..(DECKSIZE-1)).to_a.shuffle.map { |id| Card.new(id) }
    #unshuffled
    #self.cards = (0..(DECKSIZE-1)).to_a.shuffle.map { |id| Card.new(id) }
    puts "The deck is suffled & ready. \n\n"
  end

  def inspect_deck
    self.cards.each do |card|
      puts card.inspect
    end
  end
end