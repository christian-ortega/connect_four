require_relative "connect_four"

class Game
  attr_reader :connect_four_game

  def initialize(width = 7, height = 6)
    @connect_four_game = ConnectFour.new(width, height)
  end

  def play
    connect_four_game.update_display
    loop do
      break if turn(1)
      connect_four_game.update_display
      break if turn(2)
      connect_four_game.update_display
    end
    connect_four_game.update_display

    puts "GAME OVER"
  end

  def turn(player_number)
    symbol = player_symbol(player_number)

    column_number = nil
		loop do
			puts "Player #{player_number}'s turn"
			print "Enter column number where you wish to place ( #{symbol} ) chip: "
			column_number = gets.chomp.to_i - 1
			puts ""
			break if column_number.between?(0, connect_four_game.width - 1) && connect_four_game.grid[column_number][connect_four_game.height - 1].nil?
			puts "Invalid Entry! Try again."
			puts ""
		end
    
    return connect_four_game.place_chip(column_number, symbol)
  end

  def player_symbol(player_number)
    return "O" if player_number == 1
    return "@" if player_number == 2
  end
end