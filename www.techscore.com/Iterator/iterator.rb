class Student
  attr_reader :name, :sex

  def initialize(name, sex)
    @name = name
    @sex = sex
  end
end

class StudentList
  attr_reader :students, :last

  def initialize
    @students = []
    @last = 0
  end

  def add(student)
    @students << student
    @last += 1
  end

  def student_at(index)
    @students[index]
  end

  def last
    @last
  end
end

class Teacher
  def create_student_list
    @student_list = StudentList.new
    @student_list.add(Student.new("赤井亮太", 1))
    @student_list.add(Student.new("赤羽里美", 2))
    @student_list.add(Student.new("岡田未央", 2))
    @student_list.add(Student.new("西森俊介", 1))
    @student_list.add(Student.new("中ノ森玲奈", 2))
  end

  def call_students
    for i in 0...@student_list.last
      puts @student_list.student_at(i).name
    end
  end
end

t = Teacher.new
t.create_student_list
t.call_students
