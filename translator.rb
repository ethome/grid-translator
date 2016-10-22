#!/usr/bin/env ruby

require_relative 'translator'
require_relative 'grid_parser'
require_relative 'coordinate_parser'

class Translator
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

if __FILE__ == $0
  grid_filename, *coordinates = ARGV

  translator = Translator.new(GridParser.new, CoordinateParser.new)
  result = translator.translate(grid_filename, coordinates)

  puts result
end
