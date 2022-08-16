# frozen_string_literal: true

# app/cell.rb
class Cell
  attr_accessor :status, :pos_x, :pos_y

  def initialize
    @status = 0
  end

  def alive?
    @status == '*'
  end

end
