class Triangle
  
  def initialize(row_amount)
    @row_amount = row_amount
  end
  
  def rows
  	
  	rows = [[1]]
  	
  	for i in 1..(@row_amount - 1)
      row = []
      for j in 0..i
        if j == 0
          row.push(0 + rows[i - 1][j])
        elsif j == i
          row.push(rows[i - 1][j - 1] + 0)
        else
          row.push(rows[i - 1][j - 1] + rows[i - 1][j])
        end
      end
      rows.push(row)
  	end
  	
  	return rows
  	
  end
  
end