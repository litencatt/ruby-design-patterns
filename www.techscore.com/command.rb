class Beaker
  def initialize(water, salt)
    @water = water
    @salt = salt
    @melted = true
    mix
  end

  def add_salt(amount)
    @salt += amount
  end

  def add_water(amount)
    @water += amount
  end

  def mix
    if concentration < 26.4
      @melted = true
    else
      @melted = false
    end
  end

  def melted?
    @melted
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

class Command
  def set_beaker(beaker)
    @beaker = beaker
  end

  def execute
  end
end

class AddSaltCommand < Command
  def execute
    while @beaker.melted?
      @beaker.add_salt(1)
      @beaker.mix
    end
    puts "食塩を1gずつ加える実験"
    @beaker.note
  end
end

class AddWaterCommand < Command
  def execute
    while !@beaker.melted?
      @beaker.add_water(10)
      @beaker.mix
    end
    puts "水を10gずつ加える実験"
    @beaker.note
  end
end

class MakeSaltWaterCommand < Command
  def execute
    @beaker.mix
    puts "食塩水を作る実験"
    @beaker.note
  end
end

class Student
  def exec
    add_salt = AddSaltCommand.new
    add_water = AddWaterCommand.new
    make_salt_water = MakeSaltWaterCommand.new

    add_salt.set_beaker(Beaker.new(100, 0))
    add_water.set_beaker(Beaker.new(0, 10))
    make_salt_water.set_beaker(Beaker.new(90, 10))

    add_salt.execute
    add_water.execute
    make_salt_water.execute
  end
end

student = Student.new
student.exec
