require_relative 'piece'
require "singleton"

class Null < Piece
  include Singleton
  attr_reader :symbol, :color

  def initialize
    @symbol = :"   "
    @color = :none
  end

  def to_s
    self.symbol.to_s
  end

end
