#!/usr/bin/env ruby

require_relative 'citrix_translator'
require_relative 'grid_parser'
require_relative 'coordinate_parser'

grid_filename, *coordinates = ARGV

translator = CitrixTranslator.new(GridParser.new, CoordinateParser.new)
result = translator.translate(grid_filename, coordinates)

puts result
