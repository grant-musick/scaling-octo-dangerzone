


class Runner


  def doWork
    yield
  end

end


class SomeWork

  def self.work
    puts "Did some work"
  end

end


r = Runner.new

r.doWork do SomeWork.work end

require './block_test_helper'
r.doWork do SomeOtherWork.work end