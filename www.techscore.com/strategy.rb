class Human
  attr_reader :name, :height, :weight, :age

  def initialize(name, height, weight, age)
    @name = name
    @height = height
    @weight = weight
    @age = age
  end
end

class AgeComparator
  def compare(h1, h2)
    if h1.age > h2.age
      1
    elsif h1.age == h2.age
      0
    else
      -1
    end
  end
end

class HeightComparator
  def compare(h1, h2)
    if h1.height > h2.height
      1
    elsif h1.height == h2.height
      0
    else
      -1
    end
  end
end

class SampleClass
  def initialize(comparator)
    @comparator = comparator
  end

  def compare(h1, h2)
    @comparator.compare(h1, h2)
  end
end


h1 = Human.new("taro", 160, 50, 20)
h2 = Human.new("jiro", 170, 60, 20)

s = SampleClass.new(AgeComparator.new)
puts s.compare(h1, h2)

s = SampleClass.new(HeightComparator.new)
puts s.compare(h1, h2)
