class ConnectFour
  attr_reader :grid

  def initialize(width = 7, height = 6)
    @grid = Array.new(width) { Array.new(height) }
  end

  def place_chip(column_number, chip_type)
    height = grid[column_number].length
    height.times do |index|
      if grid[column_number][index].nil?
        grid[column_number][index] = chip_type
        return
      end
    end
  end

  def update_display

  end

  def game_over?

  end
end