#encoding: utf-8

# Inspecteur en Ruby : inspection et navigation de la hiérarchie d'objets.
#---------------------------------------------------------------------

require '../inspector/xmlserializer'
require 'yaml'

# Nécessaire pour avoir la méthode singleton_class dans Ruby < 1.9.1.
module Kernel
  unless Kernel.respond_to? :singleton_class
    # Renvoie la classe de la classe d'un sous-type de Kernel.
    def singleton_class
      class << self; self; end
    end
  end
end

module Inspector

  include XMLSerializer

  def self.inspect_object something
    puts "Inspection de #{something} :"
    puts "---------------------------------------------------------------------"

    inspect_instance something, something.class
  end

  def self.inspect_instance something, klass
    puts "#{something} est une instance de \"#{klass.name}\""
    puts "Leurs méta-classes sont : #{something.singleton_class} et #{klass.singleton_class}"
    puts "---------------------------------------------------------------------"
    print "La hiérarchie de type est : "
    klass.ancestors.each do |ancestor|
      print "#{ancestor} -> "
    end
    puts "\n---------------------------------------------------------------------"

    puts "Les attributs de classe de \"#{klass.name}\" sont :"
    klass.class_variables.each do |attribute|
      inspect_class_attribute attribute, klass
    end

    puts "Les attributs d'instance de \"#{something}\" sont :"
    something.instance_variables.each do |attribute|
      inspect_instance_attribute attribute, something
    end

    puts "---------------------------------------------------------------------"

    puts "Les méthodes de \"#{klass.name}\" sont :"
    puts "-- Private :"
    klass.private_methods(false).each do |method|
      puts "- #{method}" # "#{method.parameters}"
    end
    puts "-- Public :"
    klass.public_methods(false).each do |method|
      puts "- #{method}" # "#{method.parameters}"
    end

    puts "---------------------------------------------------------------------"

    puts "Les méthodes de \"#{something}\" sont :"
    puts "-- Private :"
    something.private_methods(false).each do |method|
      puts "- #{method}" # "#{method.parameters}"
    end
    puts "-- Public :"
    something.public_methods(false).each do |method|
      puts "- #{method} " # "#{method.parameters}"
    end

  end

  # Remplace inspect_slot.
  def self.inspect_class_attribute attribute, klass
    value = klass.class_eval attribute.to_s
    puts "- #{attribute}, #{value.class}, valeur : #{value.inspect}"
  end

  # Remplace inspect_slot.
  def self.inspect_instance_attribute attribute, something
    value = something.instance_eval attribute.to_s
    puts "- #{attribute}, #{value.class}, valeur : #{value.inspect}"
  end

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


class Dog
  attr_accessor :name, :age, :loc, :race
  def initialize name, age, loc, race
    @name = name
    @age = age
    @loc = loc
    @race = race
  end
end

class Couple
  attr_accessor :one, :two
  attr_accessor :arr
  attr_accessor :wierd
  @@classvar = 5

  def initialize one, two
    @wierd = Dog.new "s", 2, "dq", true
    @one = one
    @two = two
    @arr = [0, "1", 2, "3", true, nil]
  end

  def talk
    puts "— This is a dialogue. — Of course it is."
  end
end

c = Couple.new "2", 5

#p Inspector.inspect_object c
p Inspector.serialize c

