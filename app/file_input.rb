# frozen_string_literal: true

# app/File_input.rb
class File_input
  def initialize(path)
    @path = path
  end

  def read_file
    # Opens a text file containing the first generation of the game of life
    file = File.open(@path)
    file.readlines.map(&:chomp)
  end
end
