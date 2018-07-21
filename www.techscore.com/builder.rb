class SaltWater
  attr_accessor :water, :salt
  def initialize(water, salt)
    @water = water
    @salt = salt
  end

  def solute
    @salt
  end

  def add_solute(amount)
    @salt += amount
  end
end

class SugarWater
  attr_accessor :water, :sugar
  def initialize(water, sugar)
    @water = water
    @sugar = sugar
  end

  def solute
    @sugar
  end

  def add_solute(amount)
    @sugar += amount
  end
end


# 溶液ビルダー
class SolutionBuilder
  attr_reader :solution

  def initialize(class_name)
    @solution = class_name.new(0, 0)
  end

  def add_solvent(water_amount)
    solution.water += water_amount
  end

  def add_solute(solute_amount)
    solution.add_solute(solute_amount)
  end

  def abandon_solution(solution_amount)
    solute_delta = solution_amount * (solution.solute / (solution.solute + solution.water))
    water_delta  = solution_amount * (solution.water / (solution.solute + solution.water))

    solution.add_solute(-solute_delta)
    solution.water  -= water_delta
  end

  def result
    solution
  end
end

class Director
  attr_reader :builder

  def initialize(builder)
    @builder = builder
  end

  def cook
    builder.add_solvent(100)
    builder.add_solute(40)
    builder.abandon_solution(70)
    builder.add_solute(15)
  end
end

builder = SolutionBuilder.new(SaltWater)
director = Director.new(builder)
director.cook
p builder.result

builder = SolutionBuilder.new(SugarWater)
director = Director.new(builder)
director.cook
p builder.result
