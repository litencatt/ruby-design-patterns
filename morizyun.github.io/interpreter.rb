class Expression
  def |(other)
    Or.new(self, other)
  end

  def &(other)
    And.new(self, other)
  end
end

require 'find'

# 指定ディレクトリ内のすべてのファイルを返す
class All < Expression
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p
    end
    results
  end
end

# 指定パターンと一致するファイル名を返す
class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      name = File.basename(p)
      results << p if File.fnmatch(@pattern, name)
    end
    results
  end
end

# 指定サイズより大きいファイル名を返す
class Bigger < Expression
  def initialize(size)
    @size = size
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p if File.size(p) > @size
    end
    results
  end
end

class Writable < Expression
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p if File.writable?(p)
    end
    results
  end
end

class Not < Expression
  def initialize(expression)
    @expression = expression
  end

  def evaluate(dir)
    All.new.evaluate(dir) - @expression.evaluate(dir)
  end
end

class Or < Expression
  def initialize(expression1, expression2)
    @expression1 = expression1
    @expression2 = expression2
  end

  def evaluate(dir)
    result1 = @expression1.evaluate(dir)
    result2 = @expression2.evaluate(dir)
    (result1 + result2).sort.uniq
  end
end

class And < Expression
  def initialize(expression1, expression2)
    @expression1 = expression1
    @expression2 = expression2
  end

  def evaluate(dir)
    result1 = @expression1.evaluate(dir)
    result2 = @expression2.evaluate(dir)
    (result1 & result2)
  end
end

complex_expression1 = And.new(FileName.new("*.mp3"), FileName.new("big*"))
puts complex_expression1.evaluate('./')

complex_expression2 = Bigger.new(1024000)
puts complex_expression2.evaluate('./')

complex_expression3 = FileName.new("*.mp3") & FileName.new("big*")
puts complex_expression3.evaluate('./')

complex_expression4 = All.new
puts complex_expression4.evaluate('./www.techscore.com')
