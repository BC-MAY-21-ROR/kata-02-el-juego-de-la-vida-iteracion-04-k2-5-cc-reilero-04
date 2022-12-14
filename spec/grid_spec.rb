# frozen_string_literal: true

# spec/grid_spec.rb
require_relative '../app/grid'
require_relative '../app/file_input'
require_relative '../app/cell'

describe Grid do
  before do
    @file_input = File_input.new('input_grid.text').read_file
    @grid = Grid.new(@file_input)
  end

  describe '#set_cell_status' do
    context 'given an input file' do
      it 'generates a board filled with cells' do
        expect(@grid.board[2][2]).to be_instance_of(Cell)
      end

      it 'generates a board with 4 rows' do
        expect(@grid.board.length).to eq(4)
        expect(@grid.height).to eq(4)
      end

      it 'generates a board with 8 columns' do
        expect(@grid.board[0].length).to eq(8)
        expect(@grid.width).to eq(8)
      end
    end
  end
  describe '#valid_neighbors' do
    context 'given the first cell of the board' do
      it 'return 3 valid neighbors' do
        expect(@grid.valid_neighbors(@grid.board[0][0]).size).to eq(3)
      end
    end
    context 'given a cell that isnt on the edge of the board' do
      it 'returns 8 valid neighbors' do
        expect(@grid.valid_neighbors(@grid.board[1][1]).size).to eq(8)
      end
    end
  end
end
