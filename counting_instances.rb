class Russ
  @count = 0
  
  class << self
    attr_accessor :count
  end
  
  def initialize
    Russ.count += 1
  end
  
end

puts '~~~~~~~~~~~~~~~~~'
p "There are #{Russ.count} of me"
puts '~~~~~~~~~~~~~~~~~'
r = Russ.new
r = Russ.new
r = Russ.new
r = Russ.new
p "There are #{Russ.count} of me"
puts '~~~~~~~~~~~~~~~~~'
