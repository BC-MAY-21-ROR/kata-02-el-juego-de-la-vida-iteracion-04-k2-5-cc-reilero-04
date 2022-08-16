# frozen_string_literal: true
require_relative "validation"
# app/Grid.rb
class Grid
  attr_reader :height, :width
  attr_accessor :board

  def initialize(input_array)
    @height = input_array.size
    @width = input_array[0].size
    @board = Array.new(@height) { Array.new(@width) { Cell.new } }
    set_cell_status(input_array)
  end

  def set_cell_status(input_array)
    @height.times do |i|
      @width.times do |j|
        @board[i][j].status = input_array[i][j]
        @board[i][j].pos_x = i
        @board[i][j].pos_y = j
      end
    end
  end

  
  def valid_neighbors(pos_x, pos_y)
    possibles_positions_neighbors = [
      [pos_x - 1, pos_y - 1],
      [pos_x - 1, pos_y],
      [pos_x - 1, pos_y + 1],
      [pos_x, pos_y - 1],
      [pos_x, pos_y + 1],
      [pos_x + 1, pos_y - 1],
      [pos_x + 1, pos_y],
      [pos_x + 1, pos_y + 1]
    ]

    positions_neighbors = possibles_positions_neighbors.select do |pos|
      Validation.valid_position?(self, pos[0], pos[1])
    end
    positions_neighbors.each do |pos|
    valid_neighbors = @board[pos[0]] [pos[1]]
  end
  valid_neighbors
  end

  def alive_neighbors(positions_neighbors)
    alive_neighbors = positions_neighbors.select do |pos|
      @board[pos[0]][pos[1]].alive?
    end
 end
end

