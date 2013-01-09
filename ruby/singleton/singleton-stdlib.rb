# Design pattern Singleton en Ruby : avec la librairie standard de Ruby.
#---------------------------------------------------------------------
# Documentation sur la librairie : http://ruby-doc.org/stdlib-1.9.3/libdoc/singleton/rdoc/Singleton.html
# Code source (commenté) de la librairie : https://github.com/ruby/ruby/blob/trunk/lib/singleton.rb
# Spécifications du module Singleton : https://github.com/rubyspec/rubyspec/tree/master/library/singleton

# Import du module Singleton de la librairie standard.
require 'singleton'

# Création de la classe qui va être un singleton.
class Hermit
  # mixin : On inclut le code du module Singleton dans la classe courante.
  include Singleton
  # C'est tout.

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
