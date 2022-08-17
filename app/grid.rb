# frozen_string_literal: true

require_relative 'validation'
# app/Grid.rb
class Grid
  # This class contains the board of the game of life
  attr_reader :height, :width
  attr_accessor :board

  def initialize(input_array)
    @height = input_array.size
    @width = input_array[0].size
    @board = Array.new(@height) { Array.new(@width) { Cell.new } }
    initialize_cells(input_array)
  end

  def initialize_cells(input_array)
    @height.times do |row|
      @width.times do |col|
        @board[row][col].status = input_array[row][col]
        @board[row][col].pos_x = row
        @board[row][col].pos_y = col
        @board[row][col].neighbors = valid_neighbors(@board[row][col])
      end
    end
  end

  def valid_neighbors(cell)
    neighbors = []
    possibles_positions_neighbors = [
      [cell.pos_x - 1, cell.pos_y - 1],
      [cell.pos_x - 1, cell.pos_y],
      [cell.pos_x - 1, cell.pos_y + 1],
      [cell.pos_x, cell.pos_y - 1],
      [cell.pos_x, cell.pos_y + 1],
      [cell.pos_x + 1, cell.pos_y - 1],
      [cell.pos_x + 1, cell.pos_y],
      [cell.pos_x + 1, cell.pos_y + 1]
    ]

    positions_neighbors = possibles_positions_neighbors.select do |pos|
      Validation.valid_position?(self, pos[0], pos[1])
    end
    positions_neighbors.each do |pos|
      neighbors << @board[pos[0]][pos[1]]
    end
    neighbors
  end
end
