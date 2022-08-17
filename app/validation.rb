# frozen_string_literal: true

class Validation
  # This class contains all the validations for the game
  # true or false si la posicion esta en la grilla ?
  def self.valid_position?(grid, pos_x, pos_y)
    valid_pos_x = pos_x >= 0 && pos_x < grid.height
    valid_pos_y = pos_y >= 0 && pos_y < grid.width
    valid_pos_x && valid_pos_y
  end

  def self.alive_neighbors(cell)
    alive = cell.neighbors.select(&:alive?)
    alive.size
  end

  def self.cell_will_live?(cell, num_alive_neighbors)
    (cell.alive? && [2, 3].include?(num_alive_neighbors)) || (!cell.alive? && num_alive_neighbors == 3)
  end
end
