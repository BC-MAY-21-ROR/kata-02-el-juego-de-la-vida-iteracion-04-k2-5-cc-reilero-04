# frozen_string_literal: true

require_relative '../app/grid'
require_relative '../app/file_input'
require_relative '../app/cell'
require_relative '../app/validation'

describe Validation do
  before do
    @file_input = File_input.new('input_grid.text').read_file
    @grid = Grid.new(@file_input)
  end

  describe '#alive_neighbors' do
    context 'given cell in position [1][3]' do
      it 'returns 3 alive neighbors' do
        expect(Validation.alive_neighbors(@grid.board[1][3])).to eq(3)
      end
    end
    context 'given cell in position [3][3]' do
      it 'returns 2 alive neighbors' do
        expect(Validation.alive_neighbors(@grid.board[3][3])).to eq(2)
      end
    end
  end
  describe '#cell_will_live?' do
    context 'given a cell that is alive with 4 alive neighbors' do
      it 'will die so returns false' do
        expect(Validation.cell_will_live?(@grid.board[1][4], 4)).to eq(false)
      end
    end
    context 'given a cell that is alive with 3 alive neighbors' do
      it 'will live so returns true' do
        expect(Validation.cell_will_live?(@grid.board[1][4], 3)).to eq(true)
      end
    end
  end
end
