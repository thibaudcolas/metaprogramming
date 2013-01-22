module Wheelboat
	@wheelnb =4
end
# Établir un ordre total à partir d'un ordre partiel
module Dayboat
	@day =1
end

module Engineless
	include Wheelboat
	include Dayboat
	def entretient
		return "entretenu"
	end
end

module Multihull
	include Dayboat
	@hullnb =2
end


module Catamaran
	include Multihull
	def speed(d,t)
		return d*t
	end
end

module Pedal
	include Catamaran
	include Engineless
	include Wheelboat
	@pedalnb =4
end

class Boat < Object
	def initialize(name)
		puts "boat"
		@name = name
	end
end

class Pedalo <Boat
	include Pedal
	include Catamaran
	def initialize(name)
		puts "pedalo"
		super(name)
	end
	def print()
		puts"Boat : "+@name
	end
end

pedalo = Pedalo.new("youpi")
#pedalo.print()
#puts pedalo.speed(2,4)
#puts pedalo.entretient
