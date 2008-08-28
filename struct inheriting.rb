# a short example from Dave Thomas's meta series of screencasts
# a quick way to track children of inheritance

class Struct
  @children = []
  class << self
    attr_reader :children
    def inherited(child)
      @children << child
    end
  end
end

Dave = Struct.new(:name)
Fred = Struct.new(:age)

p Struct.children