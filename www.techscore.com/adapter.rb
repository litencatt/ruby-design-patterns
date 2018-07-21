class Taro
  def enjoy_with_all_classmate
  end
end

class Chairperson
  def organize_class
  end
end

class NewTaro < Taro
  def organize_class
    enjoy_with_all_classmate
  end
end

class Teacher
  def main
    chairperson = NewTaro.new
    chairperson.organize_class
  end
end
