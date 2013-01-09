# Design pattern Singleton en Ruby : méthodes de module / méta-classe / statiques
#---------------------------------------------------------------------
# Méta-classes et hiérarchie de types de Ruby : http://madebydna.com/all/code/2011/06/24/eigenclasses-demystified.html
# Article sur class << self et les méta-classes : http://yehudakatz.com/2009/11/15/metaprogramming-in-ruby-its-all-about-the-self/
# Article bis : http://openmymind.net/2010/6/25/Learning-Ruby-class-self/

# Création du module qui va être un singleton.
# Les Module est plus haut dans la hiérarchie de types que les Class.
module Hermit
  # Dans ce bloc, self est la méta-classe du module Hermit.
  class << self
    # Pas besoin de supprimer new car Module n'a pas de méthode new.

    # Les méthodes définies ici sont appelées directement sur la classe Hermit plutôt que sur l'une de ses instances.
    # Pour faire simple, c'est équivalent à une méthode statique.
    # Plus précisément, les méthodes sont ajoutées à la méta-classe (singleton-class) de Hermit.
    # L'article #1 ci-dessus est plus précis encore.
    def talk
      puts "I'm alone."
    end
  end

  # Cette méthode est elle aussi statique / dans la méta-classe.
  def self.chat
    puts "I'm still alone."
  end
end

# Tests.

Hermit.talk
puts Hermit

puts "--"
# Affiche les méthodes attachées à la méta-classe de Hermit.
puts Hermit.singleton_methods
puts "--"

puts Hermit.inspect
# H est la méta-classe de Hermit.
h = class << Hermit; self; end
puts h.inspect
