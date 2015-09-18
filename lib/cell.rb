class Cell
  attr_accessor :content, :hit

  def initialize
    @hit = false
    @content = :w
  end

  def hit
    raise "Cell already hit" if hit?
    content.hit
    @hit = true
  end

  def hit?
    @hit
  end
end