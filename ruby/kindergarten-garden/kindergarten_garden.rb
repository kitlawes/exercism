class Garden

  def initialize(garden, students = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry))
    @garden = garden
    @plants = {
      "G" => :grass,
      "C" => :clover,
      "R" => :radishes,
      "V" => :violets
    }
    @students = students.map(&:downcase).sort
  end
  
  def plants(first_row, first_column)
    return [
      @plants[@garden.split("\n")[first_row][first_column]],
      @plants[@garden.split("\n")[first_row][first_column + 1]],
      @plants[@garden.split("\n")[first_row + 1][first_column]],
      @plants[@garden.split("\n")[first_row + 1][first_column + 1]]
    ]
  end
  
  def method_missing(method)
    return plants(0, @students.index(method.to_s) * 2)
  end

end