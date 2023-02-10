# frozen_string_literal: true

# tic-tac-toe game

class Interface
  def initialize
    @board = {
      1 => ' ', 2 => ' ', 3 => ' ',
      4 => ' ', 5 => ' ', 6 => ' ',
      7 => ' ', 8 => ' ', 9 => ' '
    }
    @players = %i[X O]
    @current_player = :X
  end

  def start
    loop do
      display_board
      make_move
      break if game_over? || game_won?

      switch_player
    end

    display_board
    announce_result
  end

  private

  def display_board
    puts " #{@board[1]} | #{@board[2]} | #{@board[3]} "
    puts '---+---+---'
    puts " #{@board[4]} | #{@board[5]} | #{@board[6]} "
    puts '---+---+---'
    puts " #{@board[7]} | #{@board[8]} | #{@board[9]} "
  end

  def make_move
    puts "#{@current_player}, enter your move (1-9): "
    cell = gets.to_i
  
    if @board[cell] == " "
      @board[cell] = @current_player
    else
      puts "Cell #{cell} is already occupied, choose another cell."
      make_move
    end
  end
  

  def game_over?
    @board.values.none? { |cell| cell == ' ' }
  end

  def game_won?
    win_conditions = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
      [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
      [1, 5, 9], [3, 5, 7]             # diags
    ]

    win_conditions.any? do |condition|
      condition.all? { |cell| @board[cell] == @current_player }
    end
  end

  def switch_player
    @current_player = @players.reverse!.first
  end

  def announce_result
    if game_won?
      puts "#{@current_player} won!"
    else
      puts "It's a draw!"
    end
  end
end

game = Interface.new
game.start
