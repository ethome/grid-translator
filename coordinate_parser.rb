require_relative 'coordinate'

class CoordinateParser
  @@coordinate_regex = /\[*([A-Z][1-9])\]/

  def parse_one(input)
    matched_coordinate = @@coordinate_regex.match(input)

    unless matched_coordinate
      raise 'Input is invalid format. Example input: [B1] [H3] [C5]'
    end

    coordinate = matched_coordinate[1]

    column = convert_column_to_integer_index(coordinate[0])
    row = convert_row_to_integer_index(coordinate[1])

    Coordinate.new(column, row)
  end

  def parse_multiple(inputs)
    inputs.map { |input| parse_one(input) }
  end

  def convert_column_to_integer_index(letter_column)
    letter_column.ord - 'A'.ord
  end

  def convert_row_to_integer_index(row)
    row.to_i - 1
  end
end
