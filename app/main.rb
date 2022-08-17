# frozen_string_literal: true

# app/main.rb
require_relative 'grid'
require_relative 'file_input'
require_relative 'cell'
require_relative 'printer'
class Game_of_life
  def initialize(num_of_generations)
    @num_of_generations = num_of_generations
    @file_input = File_input.new('input_grid.text')
    @grid = Grid.new(@file_input.read_file)
    Printer.print_board(@grid)
    update
    Printer.print_board(@grid)
  end

  def update
    @grid.board.each do |row|
      row.each(&:next)
    end
    @grid.board.each do |row|
      row.each(&:update)
    end
  end
end

game = Game_of_life.new(1)
