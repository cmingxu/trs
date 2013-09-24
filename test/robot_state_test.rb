require "test_helper"
require "test/unit"

class RobotStateTest < Test::Unit::TestCase
  def robot_state_report robot_state
    si = StringIO.new
    robot_state.output = si
    robot_state.report
    si.rewind
    si.read
  end

  def test_creation
    robot_state = RobotState.new
    robot_state.x = 1
    robot_state.y = 2
    robot_state.f = "NORTH"

    assert_equal 1, robot_state.x
    assert_equal 2, robot_state.y
    assert_equal "NORTH", robot_state.f
  end

  def test_place
    robot_state = RobotState.new
    robot_state.place 1, 2, "NORTH"

    assert_equal 1, robot_state.x
    assert_equal 2, robot_state.y
    assert_equal "NORTH", robot_state.f
  end

  def test_report
    require "stringio"
    si = StringIO.new
    robot_state = RobotState.new si
    robot_state.place 1, 2, "NORTH"
    robot_state.report
    si.rewind
    assert_equal "1, 2, NORTH\n", si.read
  end

  def test_move
    robot_state = RobotState.new 
    robot_state.place 1, 2, "NORTH"
    robot_state.move
    assert_equal "1, 3, NORTH\n", robot_state_report(robot_state)
    robot_state.move
    assert_equal "1, 4, NORTH\n", robot_state_report(robot_state)
  end

  def test_left
    robot_state = RobotState.new 
    robot_state.place 1, 2, "NORTH"
    robot_state.left
    assert_equal "1, 2, WEST\n", robot_state_report(robot_state)
    robot_state.left
    assert_equal "1, 2, SOUTH\n", robot_state_report(robot_state)
  end


  def test_right
    robot_state = RobotState.new 
    robot_state.place 1, 2, "NORTH"
    robot_state.right
    assert_equal "1, 2, EAST\n", robot_state_report(robot_state)
    robot_state.right
    assert_equal "1, 2, SOUTH\n", robot_state_report(robot_state)
  end
end
