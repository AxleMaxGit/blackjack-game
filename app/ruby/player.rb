require './hand.rb'

class Player
  attr_accessor :name, :hand, :is_dealer

  def initialize(name, is_dealer)
    @name = name
    @is_dealer = is_dealer
    puts "#{name} is ready ..."
    puts self.inspect
  end

  def get_hand(deck)
    puts "Dealing hand to #{self.name} "
    @hand = Hand.new(deck)
    #dealer only shows one card
    if self.is_dealer==true
      puts "#{self.hand.cards.first.inspect} <Card hidden>."
    else
      #players see their own cards
      puts self.hand.inspect
    end
    puts "\n"
  end

  def get_card

  end

  def current_total
    @total = 0
    self.hand.cards.each do |c|
      if c.rank == "A" 
        @total += 11
      elsif c.rank == "J" || c.rank == "Q" || c.rank == "K"
        @total += 10 
      else
        @total += c.rank.to_i
      end
    end
    puts "#{self.name}, you have #{@total}"
  end

  def stay_or_go
    puts "Would you like another card? (y)"
    decision = gets
    if decision == "y\n"
      puts "you take a card"
    else
      puts "You have stopped on #{@total}"
    end
  end

end


