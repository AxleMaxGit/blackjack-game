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
    #dealer only shows one card
    if self.is_dealer==true
      self.hand.show_dealer_hand
    else
      #players see their own cards
      self.hand.show_hand
    end
    puts "\n"
  end

  def stay_or_go(deck)
    puts "Would you like another card? (y)"
    decision = gets
    if decision == "y\n"
      puts "#{self.name} takes a card"
      self.hand.next_card(deck)
      if self.is_dealer
        self.hand.show_dealer_hand
      else
        self.hand.show_hand
      end
      self.is_bust(deck)
    else
      puts "#{self.name} has stopped on #{self.hand.total}"
      return
    end
  end

  def dealer_turn(deck)
    if self.hand.total < 17
      self.hand.show_hand
      puts "#{self.name} takes a card"
      self.hand.next_card(deck)
      self.is_bust(deck)
    else 
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
        self.stay_or_go(deck)
      end
    end
  end

end


