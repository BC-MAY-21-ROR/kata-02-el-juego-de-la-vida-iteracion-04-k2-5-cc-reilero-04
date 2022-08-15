#app/main.rb
require_relative 'grid.rb'
require_relative 'file_input'
require_relative 'cell.rb'
require_relative 'printer.rb'
class Game_of_life
    def initialize(num_of_generations)
        @num_of_generations = num_of_generations
        @file_input = File_input.new('../input_grid.text')
        @grid = Grid.new(@file_input.read_file)
        @printer = Printer.new(@grid)
        @printer.print_board
    end
end

game = Game_of_life.new(1)