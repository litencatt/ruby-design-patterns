class Beaker
  def initialize(water, salt)
    @water = water
    @salt = salt
    @isMelted = true
    mix
  end

  def experiment(param)
    if param == :add_salt
      while melted?
        add_salt(1)
        mix
      end
      puts "食塩を1gずつ加える実験"
      note
    elsif param == :add_water
      while !melted?
        add_water(10)
        mix
      end
      puts "水を10gずつ加える実験"
      note
    end
  end

  def add_salt(amount)
    @salt += amount
  end

  def add_water(amount)
    @water += amount
  end

  def mix
    if concentration < 26.4
      @isMelted = true
    else
      @isMelted = false
    end
  end

  def melted?
    @isMelted ? true : false
  end

  def note
    puts "水#{@water}g"
    puts "食塩#{@salt}g"
    puts "濃度#{concentration}%"
  end

  def concentration
    (@salt / (@salt + @water).to_f) * 100
  end
end

beaker = Beaker.new(100, 0)
beaker.experiment(:add_salt)

beaker2 = Beaker.new(0, 10)
beaker2.experiment(:add_water)
