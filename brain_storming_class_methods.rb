# all the different ways to declare class methods on Russ
# be gentle please
# :)

module ModuleOne
  module ClassMethods
    def method_01; end
  end
  def self.included(receiver)
    receiver.extend ClassMethods
  end
end

module ModuleTwo

  def method_02; end

  def self.extended( receiver )
    def method_03; end
  end

end

class Russ
  include ModuleOne
  extend  ModuleTwo
  
  def self.method_04; end
  
  class << self
    def method_05; end
  end
  
  class << Russ
    def method_06; end
  end
  
  instance_eval do
    def method_07; end
  end

  self.instance_eval do
    def method_08; end
  end

  Russ.instance_eval do
    def method_09; end
  end

  def Russ.singleton
    class << self; self; end
  end

  singleton.send( :define_method, :method_10 ) { }

  singleton.class_eval { def method_11; end }
  
  eval("def self.method_12; end")
  
end

def Russ.method_13; end

class Russ
  def self.method_14; end
end

Russ.instance_eval do
  def method_15; end
end

class << Russ
  def method_16; end
end

Russ.singleton.send( :define_method, :method_17 ) { }

Russ.singleton.class_eval { def method_18; end }

class Russ
  def self.singleton_methods
    [ "method_19" ] + super
  end
end

class Object
  def self.inherited( subclass )
    class << subclass
      def method_20; end
    end
  end
end

class Russ
  def self.inherited( subclass )
    class << self; def method_21; end; end
  end
end

class JohnDoe < Russ; end

puts Russ.superclass
puts '~~~~~~~~~~~~~~~~~'
puts Russ.singleton_methods.sort
puts '~~~~~~~~~~~~~~~~~'

