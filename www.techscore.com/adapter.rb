class Taro
  def enjoy_with_all_classmate
  end
end

class Chairperson
  def organize_class
  end
end

class Teacher
  def main
    chairperson = Taro.new
    chairperson.organize_class
  end
end
