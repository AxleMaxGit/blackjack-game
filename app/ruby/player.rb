require './hand.rb'

class Player
  attr_accessor :name, :hand, :is_dealer

  def initialize(name, is_dealer)
    @name = name
    @is_dealer = is_dealer
    #puts "#{name} is ready ..."
  end

  def get_hand(deck)
    puts "Dealing hand to #{self.name} "
    @hand = Hand.new(deck)
    #both player cards are dealt face up
    if self.is_dealer == false
      self.hand.show_hand
    else
      #dealer only shows one card
      self.hand.show_dealer_hand
    end
    puts "\n"
  end

  def player_turn(deck)
    if self.hand.total == 21
      return
    else
      puts "Would you like another card? (y)"
      decision = gets
      if decision == "y\n"
        puts "\n#{self.name} you take a card. Your hand is now ..."
        self.hand.next_card(deck)
        self.hand.show_hand
        self.is_bust(deck)
      else
        puts "#{self.name} has stopped on #{self.hand.total}"
        return
      end
    end
  end

  def dealer_turn(deck)
    if self.hand.total < 17
      #self.hand.show_hand
      puts "#{self.name} you take a card. Your hand is now ..."
      self.hand.next_card(deck)
      self.hand.show_hand
      self.is_bust(deck)
    else 
      self.hand.show_hand
      puts "Dealer stays on #{self.hand.total}"
    end 
  end

  def is_bust(deck)
    if self.hand.total > 21
      puts "#{self.hand.total}!! #{self.name} you are bust!! Game over!!"
    else
      puts "#{self.name} your current total is #{self.hand.total}"
      if self.is_dealer == true
        dealer_turn(deck)
      else
        self.player_turn(deck)
      end
    end
  end

end


