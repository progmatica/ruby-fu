module Traceable
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
  
  module InstanceMethods
    attr_reader :trace_messages
    def initialize
      @trace_messages = []
    end
    def trace(name, args, result)
      input = "Called: #{name} #{args.inspect}"
      output = "Answered: #{result.inspect}"
      @trace_messages << [input, output]
    end
  end

  module ClassMethods
    def acts_as_traceable(*args)
      args.each {|arg| (@trace_methods ||= []) << arg }
    end
    def method_added(name)
      if @trace_methods.include? name
        return if @_adding_a_method
        @_adding_a_method = true
        original_method = "original #{name}"
        alias_method original_method, name
        define_method(name) do |*args|
          result = send original_method, *args
          trace(name, args, result)
          result
        end
        @_adding_a_method = false
      end
    end
  end
  
end

#  -----------------------------------------------------------------------------

class Russ
  include Traceable
  acts_as_traceable :add, :multiply
  def add(x)
    x + x
  end
  def multiply(x)
    x * x
  end
  def subtract(x)
    x - x
  end
end

#  -----------------------------------------------------------------------------

x = Russ.new
x.add(3)
x.subtract(4)
x.multiply(5)
x.trace_messages.each { |x| puts x } 

#=> Called: add [3]
#=> Answered: 6
#=> Called: multiply [5]
#=> Answered: 25

