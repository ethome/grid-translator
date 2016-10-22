class CitrixTranslator
  def initialize(grid_parser, coordinate_parser)
    @grid_parser = grid_parser
    @coordinate_parser = coordinate_parser
  end

  def translate(grid_filename, coordinate_inputs)
    grid = @grid_parser.parse(grid_filename)
    coordinates = @coordinate_parser.parse_multiple(coordinate_inputs)

    coordinates
      .map { |coordinate| grid[coordinate] }
      .map { |value| value.downcase }
      .join
  end
end
