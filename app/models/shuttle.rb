class Shuttle
  @@all = []
  
  attr_reader :model, :capacity, :min_age
  
  def initialize model, capacity, min_age
    @model = model
    @capacity = capacity
    @min_age = min_age
    Shuttle.all << self
  end
  
  def self.all
    @@all
  end

  def self.find_by_model model
    Shuttle.all.find{ |shuttle| shuttle.model == model }
  end

  def self.smallest_mission
    Shuttle.all.min_by{ |shuttle| shuttle.current_astronauts.length }
  end

  def self.most_common_model
    model_arr = Shuttle.all.map{ |shuttle| shuttle.model }
    model_arr.max_by { |model| model_arr.count(model) } 
  end

  def add_astronaut astronaut, launch
    self.capacity <= current_astronauts.length ?
      "This shuttle is at capacity!"
      : astronaut.age < self.min_age ?
        astronaut.name + " is too young."
        : Mission.new(self,astronaut,launch)
  end

  def current_astronauts
    Mission.all.select{ |mission| mission.shuttle == self }
      .map{ |mission| mission.astronaut }
  end

  def average_age
    Mission.all.select{ |mission| mission.shuttle == self }
      .map{ |mission| mission.astronaut.age }.sum / self.current_astronauts.length
  end

  def astronauts_specialties
    current_astronauts.map{ |astronaut| astronaut.specialty }
  end
end
