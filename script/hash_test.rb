require 'hashids'
require 'benchmark'

def get_unique_booking_id(id)
	hashids = Hashids.new("$p@rk!ng", 4)
	return hashids.encode(id)
end

def reterive_booking_id(hash)
	hashids = Hashids.new("$p@rk!ng", 4)
	return hashids.decode(hash)
end

time = Benchmark.measure {

	values = (1..10000000).to_a

	values.each do |a|
		hash = get_unique_booking_id(a)
		id = reterive_booking_id(hash).first
		
		if a != id
			puts "Error at int: "+a.to_s
		end
	end

}

puts "Completed Test Successfully in "+time.real.to_s