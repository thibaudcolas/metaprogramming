# Design pattern Singleton en Ruby : ajouter des méthodes à un objet unique / à sa méta-classe.
#---------------------------------------------------------------------
# Méta-classes et hiérarchie de types de Ruby : http://madebydna.com/all/code/2011/06/24/eigenclasses-demystified.html

# Création d'une instance de Object.
Hermit = Object.new
# Accès à la méta-classe de l'instance Hermit.
class << Hermit
  # Les méthodes définies ici sont ajoutées à la méta-classe de l'objet Hermit.
  def talk
    puts "I'm alone."
  end
end

# Tests.

Hermit.talk
puts Hermit
# Son type est Object.
puts Hermit.class

puts "--"
# Affiche les méthodes attachées à la méta-classe de Hermit.
puts Hermit.singleton_methods
puts "--"

h = class << Hermit; self; end
# Son type est Class.
puts h.class
puts h.inspect
