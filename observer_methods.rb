require 'observer'

class Russ; end
before = Russ.new.methods

Russ.send :include, Observable
after = Russ.new.methods

p after.select { |x| !before.include? x }
