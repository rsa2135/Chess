require_relative 'piece'
require "singleton"

class Null < Piece
  include Singleton
  attr_reader :symbol, :color

  def initialize
    @symbol = :"•"
    @color = :brown
  end

  def to_s
    self.symbol.to_s
  end

end
