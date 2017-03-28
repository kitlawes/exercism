class Matrix

  def initialize(matrix)
    @matrix = matrix
  end

  def rows()
    string_rows = @matrix.split("\n")
    rows = []
    string_rows.each do |string_row|
      row = []
      string_row.split(" ").each do |string_element|
        element = string_element.to_i
        row.push(element)
      end
      rows.push(row)
    end
    return rows
  end
  
  def columns()
    rows = rows()
    columns = []
    for i in 0..(rows[0].length - 1)
      column = []
      for j in 0..(rows.length - 1)
        column.push(rows[j][i])
      end
      columns.push(column)
    end
    return columns
  end
  
  def saddle_points()
    rows = rows()
    columns = columns()
    saddle_points = []
    for i in 0..(rows.length - 1)
      for j in 0..(rows[i].length - 1)
      
        saddle_point = true
        
        rows[i].each do |element|
          if element > rows[i][j]
            saddle_point = false
          end
        end
        
        columns[j].each do |element|
          if element < rows[i][j]
            saddle_point = false
          end
        end
        
        if saddle_point
          saddle_points.push([i, j])
        end
        
      end
    end
    return saddle_points
  end
  
end