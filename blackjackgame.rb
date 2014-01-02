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
    puts "There are #{deck.cards.length} cards left in the deck. Let's Play Black Jack!!!\n\n\n\n"
  end

  def play_round(deck)    
    self.players.each do |p|
      if p.is_dealer == false
        puts "#{p.name} your total so far is #{p.hand.total}"
        p.hand.show_hand
        p.player_turn(deck)
        puts "\n"
      else
        puts "#{p.name}s total so far is #{p.hand.total}"
        p.dealer_turn(deck)
        puts "\n"
      end   
    end
  end

  def results
    self.players.each do |p|
      if p.is_dealer == true
        return
      else
        #check for Blackjack
        if p.hand.total == 21 && p.hand.cards.length == 2
          puts "Black Jack!! #{p.name} wins!!"
        #If player is bust. Player Lose
        elsif p.hand.total > 21
          puts "#{p.name} you were bust. You lose!!"
        #if dealer is bust = Player Win
        elsif self.players.last.hand.total > 21
          puts "The dealer is bust. #{p.name} wins!!"
        #Test for draw
        elsif p.hand.total == self.players.last.hand.total
          puts "Dealer has #{self.players.last.hand.total}. #{p.name} has #{p.hand.total}. It's a draw"
        #test for dealer win
        elsif p.hand.total < self.players.last.hand.total
          puts "Dealer has #{self.players.last.hand.total}. #{p.name} has #{p.hand.total}. Dealer wins"
        #else player wins
        else
          puts "#{p.name} has #{p.hand.total}. Dealer has #{self.players.last.hand.total}. #{p.name} wins!!"      
        end
      end
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
game1.results
