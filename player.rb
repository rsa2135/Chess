class Player
  attr_reader :color, :display, :name

  def initialize(name, color, display)
    @display = display
    @color = color
    @name = name
  end

end
