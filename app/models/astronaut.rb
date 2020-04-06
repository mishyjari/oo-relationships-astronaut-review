class Astronaut
  @@all = []

  attr_reader :name, :age
  attr_accessor :specialty

  def initialize name, age, specialty
    @name = name
    @age = age
    @specialty = specialty
    Astronaut.all << self
  end

  def self.all 
    @@all
  end

  def self.top_three
    Astronaut.all.sort_by { |astronaut| astronaut.shuttles.length * -1 }[0...3]
  end

  def self.most_missions
    Astronaut.all.max_by { |astronaut| astronaut.shuttles.length }
  end


  def shuttles
    Mission.all.select{ |mission| mission.astronaut == self }
      .map{ |mission| mission.shuttle }
  end

  def join_shuttle shuttle, launch
    shuttle.current_astronauts.length >= shuttle.capacity ? 
      "This shuttle is at capacity!"
      : shuttle.min_age >= self.age ?
        self.name + ' is too young.'
        : Mission.new(shuttle,self,launch)
  end

  def fellow_mission_members
    Mission.all.select{ |mission| mission.astronaut == self }
      .map{ |mission| mission.shuttle.current_astronauts }.uniq
  end

end
