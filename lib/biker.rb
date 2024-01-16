require 'time'
class Biker

    attr_reader :name,
                :max_distance,
                :rides,
                :acceptable_terrain

    def initialize (name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrain = []
    end

    def learn_terrain!(terrain)
        @acceptable_terrain << terrain
    end

    def log_ride(ride, time)
        if @rides[ride] == nil && @acceptable_terrain.include?(ride.terrain) && @max_distance >= ride.total_distance
            @rides[ride] = [time]
        elsif @acceptable_terrain.include?(ride.terrain) && @max_distance >= ride.total_distance
            @rides[ride] << time
        end
    end

    def personal_record(ride)
        return false unless @rides[ride] != nil
        @rides[ride].min 
    end

    def finish_time
        Time.now.strftime("%H:%M")
    end

end