require 'csv'
require_relative 'grid'

class GridParser
  def parse(filename)
    grid = CSV.read(filename, 'rb', :col_sep => '')
    Grid.new(grid)
  end
end
