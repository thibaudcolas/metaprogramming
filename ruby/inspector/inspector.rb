# Inspecteur en Ruby : inspection et navigation de la hiérarchie d'objets.
#---------------------------------------------------------------------

require 'xmlserializer'
require 'yaml'

module Inspector

  include XMLSerializer

  def self.include_into something
    something.class.instance_eval {include Inspector}
  end

  def self.serialize something
    include_into something
    p something.to_yaml
    # On ajoute la ligne "include Inspector" à something.
    p something.to_xml
    p Marshal.dump something
  end

  # Copie profonde en sérialisant / désérialisant.
  def self.deep_copy something
    Marshal.load(Marshal.dump something)
  end
end

# Tests.

class Couple
  attr_accessor :one, :two
  attr_accessor :arr
  @@classvar = 5

  def initialize one, two
    @one = one
    @two = two
    @arr = [0, "1", 2, "3", true, nil]
  end
end

c = Couple.new "2", 5

Inspector.serialize c

