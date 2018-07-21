class OrganismFactory
  def initialize(number_animals, number_plants)
    @animals = []
    number_animals.times do |i|
      animal = new_animal("Animal #{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_plant("Plant #{i}")
      @plants << plant
    end
  end

  def get_plants
    @plants
  end

  def get_animals
    @animals
  end
end

class FrogAndAlgaeFactory < OrganismFactory
  private

  def new_animal(name)
    Frog.new(name)
  end

  def new_plant(name)
    Algae.new(name)
  end
end

class DuckAndWaterLilyFactory < OrganismFactory
  private

  def new_animal(name)
    Duck.new(name)
  end

  def new_plant(name)
    WaterLily.new(name)
  end
end

class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "Duck #{@name} is eating."
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts "Frog #{@name} is eating."
  end
end

class Algae
  def initialize(name)
    @name = name
  end

  def grow
    puts "Algae #{@name} is growing."
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts "WaterLily #{@name} is growing."
  end
end

factory = FrogAndAlgaeFactory.new(4,1)
animals = factory.get_animals
animals.each {|animal| animal.eat}
plants = factory.get_plants
plants.each {|plant| plant.grow}

factory = DuckAndWaterLilyFactory.new(3,2)
animals = factory.get_animals
animals.each {|animal| animal.eat}
plants = factory.get_plants
plants.each {|plant| plant.grow}
