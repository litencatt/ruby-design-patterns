# 集約オブジェクトの要素
class Student
  attr_reader :name, :sex

  def initialize(name, sex)
    @name = name
    @sex = sex
  end
end

# 集約オブジェクト
class StudentList
  attr_reader :students, :last

  def initialize
    @students = []
  end

  def gt_student_at(index)
    @students[index]
  end

  def add(student)
    @students << student
  end

  def length
    @students.length
  end

  def iterator
    StudentListIterator.new(self)
  end
end

class StudentListIterator
  def initialize(student_list)
    @student_list = student_list
    @index = 0
  end

  def has_next?
    @index < @student_list.length
  end

  def next_student
    student = self.has_next? ? @student_list.gt_student_at(@index) : nil
    @index += 1
    student
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
    iterator = @student_list.iterator
    while iterator.has_next?
      student = iterator.next_student
      puts student.name
    end
  end
end

t = Teacher.new
t.create_student_list
t.call_students
