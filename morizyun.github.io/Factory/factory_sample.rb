require 'pry-byebug'

class Saxophone
  def initialize(name)
    @name = name
  end

  def play
    puts "Saxophone #{@name} is playing"
  end
end

class Trumpet
  def initialize(name)
    @name = name
  end

  def play
    puts "Trumpet #{@name} is playing"
  end
end


class InstrumentFactory
  def initialize(number_instruments)
    @instruments = []
    number_instruments.times do |i|
      instrument = new_instrument("Instrument #{i}")
      @instruments << instrument
    end
  end

  def ship_out
    @tmp = @instruments.dup
    @instruments = []
    @tmp
  end
end

class SaxophoneFactory < InstrumentFactory
  def new_instrument(name)
    Saxophone.new(name)
  end
end

class TrumpetFactory < InstrumentFactory
  def new_instrument(name)
    Trumpet.new(name)
  end
end

factory = SaxophoneFactory.new(3)
saxophones = factory.ship_out
saxophones.each { |saxophone| saxophone.play }

#factory = TrumpetFactory.new(2)
#trumpets = factory.ship_out
#trumpets.each { |trumpet| trumpet.play }