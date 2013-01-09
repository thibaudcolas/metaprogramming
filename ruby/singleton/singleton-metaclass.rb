# Design pattern Singleton en Ruby : méthodes de classe / méta-classe / statiques
#---------------------------------------------------------------------
# Article sur class << self et les méta-classes : http://yehudakatz.com/2009/11/15/metaprogramming-in-ruby-its-all-about-the-self/
# Article bis : http://openmymind.net/2010/6/25/Learning-Ruby-class-self/

# Création de la classe qui va être un singleton.
class Hermit
  # Dans ce bloc, self est la méta-classe de Hermit.
  class << self
    # On supprime l'accès à Hermit.new
    undef_method :new

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
