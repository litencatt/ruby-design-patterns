class Yamada
  def question1
    puts "Answer1"
  end

  def question2
    puts "Answer2"
  end

  def question3
    puts "Answer3"
  end
end

class Fujiwara
  def initialize
    @yamada = Yamada.new
  end

  def question1
    puts "Fujiwara Answer1"
  end

  def question2
    puts "Fujiwara Answer2"
  end

  def question3
    if Time.now.strftime("%p") == "AM"
      @yamada.question3
    else
      puts "Answer tommorow"
    end
  end
end

teacher = Fujiwara.new
teacher.question1
teacher.question2
teacher.question3
