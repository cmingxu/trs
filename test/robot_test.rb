require "test_helper"
require "test/unit"

class RobotTest < Test::Unit::TestCase

  def robot_report robot
    si = StringIO.new
    robot.robot_state.output = si
    robot.report
    si.rewind
    si.read
  end

  def test_creation
    @tabletop = Tabletop.new 5, 5
    @robot = Robot.new(@tabletop)
    assert_not_nil @robot.robot_state
    assert @robot.respond_to?(:x)
    assert @robot.respond_to?(:y)
    assert @robot.respond_to?(:place)
  end

  def test_move
    @tabletop = Tabletop.new 5, 5
    @robot = Robot.new(@tabletop)
    @robot.place(4, 3, "SOUTH")
    @robot.move
    assert_equal "4, 2, SOUTH\n", robot_report(@robot)

    @robot.place(0, 0, "SOUTH")
    @robot.move
    assert_equal "0, 0, SOUTH\n", robot_report(@robot)
  end

  def test_direction
    @tabletop = Tabletop.new 5, 5
    @robot = Robot.new(@tabletop)
    assert @robot.respond_to?("south")
  end
end
