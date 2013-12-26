DECKSIZE = 52

class Card
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = %w(Spade Heart Club Diamond)

  attr_accessor :rank, :suit
  def initialize(id)
    self.rank = RANKS[id % 13]
    #self.suit = SUITS[id % 4]
    if id < DECKSIZE / SUITS.length
      self.suit = SUITS[0]
    elsif id < DECKSIZE / SUITS.length*2
      self.suit = SUITS[1]
    elsif id < DECKSIZE / SUITS.length*3
      self.suit = SUITS[2]
    else
      self.suit = SUITS[3]   
    end
  end
end



class Hand
  attr_accessor :cards
  def initialize(deck)
    puts "Dealing your hand ... "
    puts "\n"
    # start with 2 cards from the deck
    self.cards = (0..1).to_a.map { |id| deck.cards.pop }
    self.inspect_cards
    self.hand_total
    self.evaluate_hand(deck)
  end

  def hand_total
    @total = 0
    self.cards.each do |c|
      #puts "C.RANK is #{c.rank}"
      #puts c.rank.to_i
      if c.rank == "A" 
        #puts "A"
        @total += 11
      elsif c.rank == "J" || c.rank == "Q" || c.rank == "K"
        #puts "JQK"
        @total += 10 
      else
        #puts "NUM"
        @total += c.rank.to_i
      end
    end 
    puts "The running total of your hand is #{@total}"
    puts "\n"
  end

  def play_round(deck)
    self.cards.push(deck.cards.pop)
    self.hand_total
    self.evaluate_hand(deck)
  end

  def evaluate_hand(deck)
    self.inspect_cards
    if @total > 21
      puts "#{@total}!! You are bust!! Game over!!"
    else
      self.stay_or_go(deck)
      #self.play_round(deck)
    end
  end

  def stay_or_go(deck)
    puts "Would you like anohter card?"
    decision = gets
    if decision == "y\n"
      self.play_round(deck)
    else
      puts "You have stopped on #{@total}"

    end
  end

  def inspect_cards
    puts "The Cards in your hand are "
    self.cards.each do |c|
      puts c.inspect
    end
    puts "\n"
  end
end



class Deck
  attr_accessor :cards
  def initialize
    puts "\n"
    # shuffle array and init each Card
    puts "Creating & Shuffling the Deck ... \n\n"
    self.cards = (0..(DECKSIZE-1)).to_a.shuffle.map { |id| Card.new(id) }
    #unshuffled
    #self.cards = (0..(DECKSIZE-1)).to_a.shuffle.map { |id| Card.new(id) }
    puts "Deck ready. \n\n"
  end

  def inspect_deck
    self.cards.each do |card|
      puts card.inspect
    end
  end
end

class Player
  attr_accessor :name, :hands

  def initialize(name)
    @name = name
    @hands = []
    puts "#{name} is ready ..."
  end

  def deal

  end

end

class BlackjackGame
  attr_accessor :players, :deck

  def initialize
    @players = []
    @deck = Deck.new
  end
end

#BEGIN THE GAME ... Create & Shuffle the deck

game1 = BlackjackGame.new


deck1 = Deck.new

game1.players[0] = Player.new("Dealer")
game1.players[1] = Player.new("Alex")




#Deal a starting hand
hand1 = Hand.new(deck1)








