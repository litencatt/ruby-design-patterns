class SaltWater
  attr_accessor :water, :salt
  def initialize(water, salt)
    @water = water
    @salt = salt
  end
end

# 素材の適用
class SaltWaterBuilder
  attr_reader :salt_water
  def initialize
    @salt_water = SaltWater.new(0, 0)
  end

  def add_solute(salt_amount)
    @salt_water.salt += salt_amount
  end

  def add_solvent(water_amount)
    @salt_water.water += water_amount
  end

  def abandon_solution(salt_water_amount)
    salt_delta  = salt_water_amount * (@salt_water.salt  / (@salt_water.salt + @salt_water.water))
    water_delta = salt_water_amount * (@salt_water.water / (@salt_water.salt + @salt_water.water))

    @salt_water.salt  -= salt_delta
    @salt_water.water -= water_delta
  end

  def result
    @salt_water
  end
end

class Director
  attr_reader :builder

  def initialize(builder)
    @builder = builder
  end

  def cook
    @builder.add_solvent(100)
    @builder.add_solute(40)
    @builder.abandon_solution(70)
    @builder.add_solute(15)
  end
end

builder = SaltWaterBuilder.new
director = Director.new(builder)
director.cook

p builder.result
