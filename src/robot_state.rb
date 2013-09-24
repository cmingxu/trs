
class RobotState
  DIRECTION = %w(NORTH EAST SOUTH WEST)

  attr_accessor :x, :y, :f, :output

  def initialize(output = STDOUT)
    @output = output
  end

  def place(x, y, f)
    @x = x
    @y = y
    @f = f
  end

  def report
    @output.printf "%d, %d, %s\n" % [@x, @y, @f]
  end

  def move
    case @f
    when /NORTH/i
      @y = @y + 1
    when /EAST/i
      @x = @x + 1
    when /SOUTH/i
      @y = @y - 1
    when /WEST/i
      @x = @x - 1
    end
  end

  def left
    @f = DIRECTION[((DIRECTION.index(@f) + 4) - 1) % 4]
  end

  def right
    @f = DIRECTION[(DIRECTION.index(@f) + 1) % 4]
  end
end
