require "robot"
require "robot_state"
require "tabletop"

module Simulator

  def run! commands
    @tabletop = Tabletop.new(5, 5)
    @robot = Robot.new(@tabletop)

    commands.each do |c|
      begin
        @robot.instance_eval c.downcase
      rescue NameError
        STDERR.puts "[ERR] no command for #{c}"
        next
      rescue ArgumentError
        STDERR.puts "[ERR] argument error for #{c}"
        next
      end
    end
  end

  module_function :run!
end
