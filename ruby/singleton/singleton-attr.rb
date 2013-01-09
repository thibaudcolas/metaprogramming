# Design pattern Singleton en Ruby : stocker une instance
#---------------------------------------------------------------------
# Syntaxe de Ruby (pour le @@) : http://overapi.com/static/cs/RubyCheat.pdf

# La classe qui va être un singleton.
class Hermit
  # Stockage de l'instance dans la métaclasse : @var = variable d'instance, @@var = variable de classe (eq statique).
  @@instance = Hermit.new

  # Une façon de cacher la méthode new : la rendre privée.
  private_class_method :new

  # On redéfinit la méthode instance de la méta-classe de Hermit pour qu'elle retourne l'instance stockée.
  def self.instance
    return @@instance
  end

  def talk
    puts "I'm alone."
  end
end

# Tests.

h = Hermit.instance
h.talk
puts h

i = Hermit.instance
i.talk
puts i
