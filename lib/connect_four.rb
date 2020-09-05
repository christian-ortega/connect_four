class ConnectFour
  attr_reader :width, :height, :grid

  def initialize(width = 7, height = 6)
    @width = width
    @height = height
    @grid = Array.new(width) { Array.new(height) }
  end

  def place_chip(column_number, chip_type)
    height.times do |row_num|
      if grid[column_number][row_num].nil?
        grid[column_number][row_num] = chip_type
        return game_over?(column_number, row_num, chip_type)
      end
    end
  end

  def update_display
    (height - 1).downto(0) do |i|
      str = ""

      0.upto(width - 1) do |j|
        if grid[j][i].nil?
          str += "· "          
        else
          str += "#{grid[j][i]} "
        end
      end

      puts str
    end
  end

  def game_over?(column_number, row_number, chip_type)
    return true if full_board?
    return true if connect_four?(grid[column_number].clone, chip_type) # check column
    return true if connect_four?(Array.new(width) { |col_num| grid[col_num][row_number].clone }, chip_type) # check row
    return true if connect_four?(create_first_diagonal(column_number, row_number), chip_type) # check first diagonal (top-left to bottom-right)
    return true if connect_four?(create_second_diagonal(column_number, row_number), chip_type) # check second diagonal (bottom-left to top-right)
    false
  end
  
  def connect_four?(array, chip_type)
    consecutive_chips = []
    array.each do |chip|
      if chip == chip_type
        consecutive_chips.push(true)
        return true if consecutive_chips == [true, true, true ,true]
      else
        consecutive_chips = []
      end
    end
    false
  end

  def full_board?
    width.times do |col_num|
      return false if grid[col_num].include?(nil)
    end
    true
  end

  def create_first_diagonal(column_number, row_number)
    diagonal = []
    i = row_number
    j = column_number

    while i < height - 1 && j > 0  do
      i += 1
      j -= 1
    end

    while i >= 0 && j < width do
      diagonal.push(grid[j][i].clone)
      i -= 1
      j += 1
    end

    diagonal
  end

  def create_second_diagonal(column_number, row_number)
    diagonal = []
    i = row_number
    j = column_number

    while i > 0 && j > 0  do
      i -= 1
      j -= 1
    end

    while i < height && j < width do
      diagonal.push(grid[j][i].clone)
      i += 1
      j += 1
    end

    diagonal
  end
end