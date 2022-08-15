# spec/grid_spec.rb
require_relative "../app/grid.rb"
require_relative "../app/file_input.rb"
require_relative "../app/cell.rb"

describe Grid do
  before do
    @file_input = File_input.new('../input_grid.text').read_file
    @grid = Grid.new(@file_input)
  end

  describe "#set_cell_status" do
    context "given an input file" do
      it "generates a board filled with cells" do
        expect(@grid.board[2][2]).to be_instance_of(Cell)
      end

      it "generates a board with 4 rows" do
        expect(@grid.board.length).to eq(4)
        expect(@grid.height).to eq(4)
      end
      
      it "generates a board with 8 columns" do
        expect(@grid.board[0].length).to eq(8)
        expect(@grid.width).to eq(8)
      end
    end
  end
end