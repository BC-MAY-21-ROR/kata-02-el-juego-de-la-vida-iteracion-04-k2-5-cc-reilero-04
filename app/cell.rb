# frozen_string_literal: true

# app/cell.rb
class Cell
  # This class represents each space on the board/grid
  attr_accessor :status, :pos_x, :pos_y, :neighbors

  def initialize
    @status = 0
    @neighbors = []
  end

  def alive?
    @status == '*'
  end

  def update
    @status = @future_status
  end

  def next
    @future_status = Validation.cell_will_live?(self, Validation.alive_neighbors(self)) ? '*' : '.'
  end
end
