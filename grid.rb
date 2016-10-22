class Grid
  def initialize(grid)
    @grid = grid
  end

  def [](coordinate)
    value = @grid[coordinate.row][coordinate.column] 
  end
end
