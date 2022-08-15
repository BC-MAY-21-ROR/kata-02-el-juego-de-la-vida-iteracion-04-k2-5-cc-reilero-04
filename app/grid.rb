#app/Grid.rb
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
            end
        end
    end

end