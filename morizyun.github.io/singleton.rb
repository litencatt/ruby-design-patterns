require 'singleton'

class RegisterNote
  include Singleton

  attr_accessor :counter

  def initialize
    @counter = 0
  end
end

obj1 = RegisterNote.instance
obj1.counter += 1

obj2 = RegisterNote.instance
obj2.counter += 1

obj3 = RegisterNote.instance
obj3.counter += 1
puts obj3.counter
