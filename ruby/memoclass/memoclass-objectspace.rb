# Mémo-classe en Ruby : utilisation de ObjectSpace
#---------------------------------------------------------------------
# Documentation sur ObjectSpace : http://www.ruby-doc.org/core-1.9.3/ObjectSpace.html

# La classe qui ne mémorise pas vraiment ses instances mais sait les demander à ObjectSpace.
class Memo

  # Méthode de la méta-classe de Memo. Parcours tous les objets et retourne ceux de type Memo.
  def self.all_instances
    instances = []
    # Parcours tous les objets existants.
    ObjectSpace.each_object Memo do |instance|
      instances << instance
    end
    instances
  end

  def talk
    puts "They remember me."
  end
end

a = Memo.new
p a
b = Memo.new
p b

b.talk

p Memo.all_instances
