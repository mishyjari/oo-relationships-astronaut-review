require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#write your test code in here

nx01 = Shuttle.new('NX Class Starship', 83, 18)
nx02 = Shuttle.new('NX Class Startship', 83, 18)
sts101 = Shuttle.new('Space Shuttle', 8, 25)
sts111 = Shuttle.new('Space Shuttle', 8, 25)
mars1 = Shuttle.new('Mars Orbital Transport', 6, 22)
mars2 = Shuttle.new('Mars Orbital Transport', 6, 22)
mars3 = Shuttle.new('Mars Orbital Transport', 6, 22)
ncc1701 = Shuttle.new('Constitution Class Startship', 205, 20)
phoenix = Shuttle.new('FTL Test Ship', 4, 16)

scotty = Astronaut.new('Montgomery Scott', 48, 'Engineering')
z = Astronaut.new('Zephram Cochrane', 68, 'Propulsion')
archer = Astronaut.new('Jonathan Archer', 38, 'Command')
luke = Astronaut.new('Luke Skywalker', 30, 'The Force')
spock = Astronaut.new('Spock', 185, 'Science')
billy = Astronaut.new('Billy McBill', 19, 'Legos')
kirk = Astronaut.new('Kirk, James Tiberius',40,'Swag')
riker = Astronaut.new('Number One',45,'Beards')

billy.join_shuttle(nx01,Time.new(2151,04,05))
nx01.add_astronaut(archer, Time.new(2151,04,05))

phoenix.add_astronaut(z, Time.new(2063,04,05))
phoenix.add_astronaut(luke, Time.new(2063,04,05))
phoenix.add_astronaut(billy, Time.new(2063,04,05))
kirk.join_shuttle(ncc1701, Time.new(2250,01,01))
phoenix.add_astronaut(riker, Time.new(2063,04,05))
luke.join_shuttle(nx02,Time.new(2155,01,01))
riker.join_shuttle(ncc1701,Time.new(2240,01,02))
riker.join_shuttle(sts101,Time.new(1980,03,04))
riker.join_shuttle(nx01,Time.new(2151,04,05))
spock.join_shuttle(sts101,Time.new(1980,03,04))


binding.pry

puts "Let's go to space!" # just in case pry is buggy and exits
