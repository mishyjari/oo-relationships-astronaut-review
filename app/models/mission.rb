class Mission
  @@all = []

  attr_accessor :shuttle, :astronaut, :launch_date

  def initialize shuttle, astronaut, launch_date
    @shuttle = shuttle
    @astronaut = astronaut
    @launch_date = launch_date
    Mission.all << self
  end

  def self.all
    @@all
  end

  def self.active_shuttles
    Mission.all.map{ |mission| mission.shuttle }
  end

  def self.oldest_date
    Mission.all.min_by { |mission| mission.launch_date }.launch_date
  end
  
  def self.first_launch
    Mission.all.select{ |mission| mission.launch_date == Mission.oldest_date }
      .map{ |mission| mission.astronaut }
  end

end
