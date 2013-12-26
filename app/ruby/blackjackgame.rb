require './deck.rb'
require './player.rb'

class BlackjackGame
  attr_accessor :players, :deck

  def initialize
    @players = []
    @deck = Deck.new
  end

  def deal(deck)
    self.players.each do |player|
      player.get_hand(deck)
    end
    puts "There are #{deck.cards.length} cards left in the deck. Let's Play!!!\n\n"
  end

  def play_round(deck)
    #show running total for each player
    self.players.each do |p|
      puts "#{p.name} your total so far is #{p.hand.total}"
      p.stay_or_go(deck)
      puts "\n" 
    end
  end

  def summary
    self.players.each do |p|
      puts "#{p.name} had #{p.hand.total}"
    end
  end

end

#Clear screen for new game
system("clear")

#BEGIN THE GAME ... Create & Shuffle the deck
game1 = BlackjackGame.new

#set players
#TODO replace with a  method to ask for number of players 
game1.players[0] = Player.new("Alex", false)
game1.players[1] = Player.new("Clare", false)
game1.players[2] = Player.new("Dealer", true)
puts "\n"

#deal starting hands
game1.deal(game1.deck)
game1.play_round(game1.deck)
game1.summary
