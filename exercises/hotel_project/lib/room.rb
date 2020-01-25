class Room
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def full?
    self.capacity == self.occupants.size
  end

  def available_space
    self.capacity - self.occupants.size
  end

  def add_occupant(name)
    if full?
      false
    else
      @occupants << name
      true
    end
  end
end
