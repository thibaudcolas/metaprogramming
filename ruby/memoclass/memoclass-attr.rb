# Mémo-classe en Ruby : stockage des instances dans la méta-classe.
#---------------------------------------------------------------------
# Syntaxe de Ruby (pour le @@) : http://overapi.com/static/cs/RubyCheat.pdf

# La classe qui mémorise ses instances. Sa méta-classe est la classe des classes qui mémorisent leurs instances.
class Memo
  # Stockage des instances. @@ = variable de classe.
  @@instances = []

  # initialize est appelée à chaque new. Le self (instance de Memo) est stocké dans la variable instances de la méta-classe de Memo.
  def initialize
    @@instances << self
  end

  # Retourne @@instances.
  def self.all_instances
    @@instances
  end

  def self.last_instance
    @@instances.last
  end

  def talk
    puts "They remember me."
  end
end

# Tests.

a = Memo.new
p a
b = Memo.new
p b

b.talk

p Memo.last_instance
p Memo.all_instances

class Person < Memo
  def initialize name, job
    super()
    @name = name
    @job = job
  end
end

class Student < Person
  def initialize name
    super name, "Student"
  end
end

tom = Student.new "Tom"
lea = Student.new "Lea"
eve = Person.new "Eve", "Scientist"


p Memo.last_instance
p Memo.all_instances
