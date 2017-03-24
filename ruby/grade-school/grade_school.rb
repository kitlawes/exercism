class School

  def initialize(*factors)
    @everyone = []
  end
  
  def add(student, student_grade)
  
    grade_exists = false
    @everyone.each do |everyone_grade|
      if everyone_grade[:grade] == student_grade
        everyone_grade[:students].push(student)
        everyone_grade[:students] = everyone_grade[:students].sort
        grade_exists = true
        break
      end
    end
    
    if !grade_exists
      @everyone.push({grade: student_grade, students: [student]})
      @everyone = @everyone.sort_by { |everyone_grade| everyone_grade[:grade] }
    end
    
  end
  
  def students(student_grade)
    @everyone.each do |everyone_grade|
      if everyone_grade[:grade] == student_grade
        return everyone_grade[:students]
      end
    end
  end
  
  def students_by_grade()
    return @everyone
  end
  
end

module BookKeeping
  VERSION = 3
end