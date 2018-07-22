class Operand
  def operand_string
  end
end

class Ingredient < Operand
  attr_reader :operand_string

  def initialize(operand_string)
    @operand_string = operand_string
  end

  def operand_string
    @operand_string
  end
end

class Expression < Operand
  def initialize(operator)
    @operator = operator
  end

  def operand_string
    @operator.execute.operand_string
  end
end

class Operator
  def execute
  end
end

class Plus < Operator
  def initialize(operand1, operand2)
    @operand1 = operand1
    @operand2 = operand2
  end

  def execute
    Ingredient.new("#{@operand1.operand_string}と#{@operand2.operand_string}を足したもの")
  end
end

class Wait < Operator
  def initialize(minutes, operand)
    @minutes = minutes
    @operand = operand
  end

  def execute
    Ingredient.new("#{@operand.operand_string}を#{@minutes}分置いたもの")
  end
end

cup  = Ingredient.new("麺")
soup = Ingredient.new("液体スープ")
e1 = Expression.new(Plus.new(cup, soup))
puts e1.operand_string

e2 = Expression.new(Plus.new(e1, Ingredient.new("お湯")))
puts e2.operand_string

e3 = Expression.new(Wait.new(3, e2))
puts e3.operand_string

e4 = Expression.new(Plus.new(e3, Ingredient.new("液体スープ")))
puts e4.operand_string
