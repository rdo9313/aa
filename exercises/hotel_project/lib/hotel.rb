require_relative "room"

class Hotel
  def initialize(name, capacities)
    @name = name
    @rooms = {}

    capacities.each do |room_name, capacity|
      @rooms[room_name] = Room.new(capacity)
    end
  end

  def name
    @name.split(' ').map do |word|
      word.capitalize
    end.join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.keys.include?(room)
  end

  def check_in(person, room)
    if room_exists?(room)
      if self.rooms[room].add_occupant(person)
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    self.rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    self.rooms.each do |room|
      puts "#{room[0]}: #{room[1].available_space}" 
    end
  end
end
