class Taro
  def enjoy_with_all_classmate
    puts "enjoy"
  end
end

class NewTaro < Taro
  def organize_class
    enjoy_with_all_classmate
  end
end

class Hanako
  def initialize
    @taro = Taro.new
  end

  def organize_class
    @taro.enjoy_with_all_classmate
  end
end

# 継承を利用したAdapter
chairperson = NewTaro.new
chairperson.organize_class

# 委譲を利用したAdapter
chairperson = Hanako.new
chairperson.organize_class
