class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |k,v| k[v] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    self.teachers << teacher
  end

  def enroll(student)
    if self.students.size < @student_capacity
      self.students << student
      true
    else
      return false
    end
  end

  def enrolled?(student)
    self.students.include?(student)
  end

  def student_to_teacher_ratio
    self.students.size / self.teachers.size
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      true
    else
      false
    end
  end

  def num_grades(student)
    @grades[student].size
  end

  def average_grade(student)
    if enrolled?(student) && @grades[student].size > 0
      @grades[student].reduce(:+) / @grades[student].size
    else
      nil
    end
  end
end
