# quickly showing what methods have been added by including observable

class Russ; end
p "declaring class Russ"

p "~~~~~~~~~~~~~~~~~~~"
p "My ancestors before are: " + Russ.ancestors.join(', ')
p "My modules before are: " + Russ.included_modules.join(', ')

r = Russ.new
before = r.methods

require 'observer'
Russ.send :include, Observable
p "~~~~~~~~~~~~~~~~~~~"
p "including Observable into class Russ"

p "~~~~~~~~~~~~~~~~~~~"
p "My ancestors after are: " + Russ.ancestors.join(', ')
p "My modules after are: " + Russ.included_modules.join(', ')

r = Russ.new
after = r.methods
p "~~~~~~~~~~~~~~~~~~~"
p "My new methods are: "
p after.select { |x| !before.include? x }
