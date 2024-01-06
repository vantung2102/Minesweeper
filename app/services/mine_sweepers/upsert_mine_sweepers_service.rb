module MineSweepers
  class UpsertMineSweepersService < ApplicationService
    MINE = 'mine'
    attr_reader :height, :width, :mines
    attr_accessor :mine_sweeper, :attributes

    def initialize(mine_sweeper, attributes)
      @attributes = attributes
      @mine_sweeper = mine_sweeper
      @height = attributes[:height].to_i
      @width = attributes[:width].to_i
      @mines = attributes[:mines].to_i
    end

    def call
      ActiveRecord::Base.transaction do
        upsert_mine_sweeper!

        [true, mine_sweeper]
      rescue StandardError
        [false, mine_sweeper]
      end
    end

    private

    def upsert_mine_sweeper!
      board = Array.new(width) { Array.new(height) }
      place_mines(board)
      fill_numbers(board)

      attributes.merge!(board: board)
      mine_sweeper.assign_attributes(attributes)

      mine_sweeper.save!
    end

    def place_mines(board)
      mines_planted = 0

      while mines_planted < mines
        row = rand(width)
        col = rand(height)

        if board[row][col] != MINE
          board[row][col] = MINE
          mines_planted += 1
        end

        break if mines >= width * height
      end
    end

    def fill_numbers(board)
      board.each_with_index do |row, row_index|
        row.each_with_index do |cell, cell_index|
          next if cell == MINE

          board[row_index][cell_index] = neighbors(row_index, cell_index).count { |x, y| board[x][y] == MINE }
        end
      end
    end

    def neighbors(row, col)
      positions = []

      (row - 1..row + 1).each do |i|
        (col - 1..col + 1).each do |j|
          positions << [i, j] if i >= 0 && i < width && j >= 0 && j < height
        end
      end

      positions.delete([row, col])
      positions
    end
  end
end
