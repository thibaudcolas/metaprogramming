# Design pattern Singleton en Ruby : méthodes de méta-classe / eigenclasse.
#---------------------------------------------------------------------
# Une ultime variation pour renforcer le côté "métaprogrammation"

# Création d'une instance de Object.
Hermit = Object.new

# Une façon d'ajouter des méthodes à la méta-classe de Hermit.
Hermit.define_singleton_method 'talk' do
  puts "I'm alone."
end

# Accès à la méta-classe de l'instance Hermit.
class << Hermit

  # Autre façon d'ajouter des méthodes.
  def chat
    puts "I'm still alone."
  end

  # Encore une autre façon plus proche de la métaprogrammation.
  define_method 'whisper' do
    puts "Forever alone."
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
