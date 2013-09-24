require "robot_state"
require "tabletop"
require "forwardable"

class Robot
  extend Forwardable
  
  attr_accessor :robot_state, :tabletop

  def_delegators :@robot_state, :x, :y, :f, :left,:right, :place, :report, :output

  def initialize(tabletop, output = STDOUT)
    @robot_state = RobotState.new 
    @tabletop    = tabletop
  end

  def move
    dup_state = @robot_state.dup
    dup_state.move
    if state_valid?(dup_state)
      @robot_state.move
    end
  end

  def live &block
    yield 
  end

  RobotState::DIRECTION.each do |direction|
    define_method direction.downcase, lambda { "#{direction}" }
  end

  private
  def state_valid?(state)
    state.x >= 0 && state.y >= 0 && state.x < @tabletop.width && state.y < @tabletop.height
  end
end

