require "test_helper"
require "test/unit"

class TabletopTest < Test::Unit::TestCase
  def test_creation
    tabletop = Tabletop.new 5, 5
    assert_equal 5, tabletop.width
    assert_equal 5, tabletop.height
  end
end
