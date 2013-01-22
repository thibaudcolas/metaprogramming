# Mémo-classe en Ruby : avec un module façon singleton
#---------------------------------------------------------------------
# Exemple de proposition de module Multiton : http://www.ruby-forum.com/topic/101486

# Ce module devra être inclus par toutes les classes qui veulent se rappeler de leurs instances.
module Memo

  # Collecteur d'instances classées par classe.
  INSTANCES = {}

  # Lien avec le constructeur de chaque classe.
  MEMO_NEW_HOOK = :memo_new

  # On va étendre les classes qui incluent le module Memo.
  def self.append_features klass

    # Les instances de la classe actuelle sont un tableau vide.
    INSTANCES[klass] = []

    # Self devient la classe actuellement étendue.
    class << klass

      # MEMO_NEW_HOOK devient un alias pour new.
      alias_method MEMO_NEW_HOOK, :new

      # instance va être appelé à la place de new avec les bons arguments.
      def instance *args, &block
        obj = send MEMO_NEW_HOOK, *args, &block
        # Stockage de l'instance dans INSTANCES[classe courante]
        INSTANCES[self] << obj

        obj
      end

      # Retourne INSTANCES[classe courante].
      def all_instances
        INSTANCES[self]
      end

      # On alias #new à notre #instance.
      alias_method :new, :instance
    end
  end
end

# Tests.

class MemoClass
  include Memo

  def talk
    puts "They remember me."
  end
end

a = MemoClass.new
b = MemoClass.new
c = MemoClass.new
p a
p b
p c

b.talk

p MemoClass.all_instances

class MemoBis
  include Memo
end

aa = MemoBis.new
bb = MemoBis.new

p MemoBis.all_instances

class Person
  include Memo

  def initialize name, job
    @name = name
    @job = job
  end
end

tom = Person.new "Tom", "Student"
lea = Person.new "Lea", "Student"
eve = Person.new "Eve", "Scientist"

p Person.all_instances
