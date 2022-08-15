#app/printer.rb
class Printer
    def initialize(grid)
        @grid = grid
    end

    def print_board
    #prints the current generation of the game of life
        @grid.height.times do |i|
            @grid.width.times do |j|
                print @grid.board[i][j].status + '  '
            end
            puts ''
        end
        puts ' '
    end
end