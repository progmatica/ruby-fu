# The point of this exercise was to show which version of 'my_method' would execute
# and how modules are included as a pseudo parent in the inheritance tree
# try removing a random 'my_method' definition to see which one gets called next.

# some modules
  module Eric
    def my_method
      "I'm Eric"
    end
  end

  module Four
    def my_method
      "I'm Four"
    end
  end

# russ extends casey
class Casey
  def my_method
    "I'm Casey"
  end
end

class Russ < Casey
  include Eric
  include Four
  def my_method
    "I'm 1st Russ"
  end
end

# re-opening russ
class Russ
  def my_method
    "I'm 2nd Russ"
  end
end

p Russ.ancestors
p "~~~~~~~~"
r = Russ.new                
p r.my_method
p "~~~~~~~~"