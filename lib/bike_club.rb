require 'time'
class BikeClub

    attr_reader :name,
                :bikers

    def initialize(name)
        @name = name
        @bikers = []
        @group_rides = []
    end

    def add_biker(biker)
        @bikers << biker
    end

    def most_rides
        @bikers.max_by do |biker|
            biker.rides.values.count
        end
    end

    def bikers_that_completed(ride)
        bikers_that_completed = []
        @bikers.each do |biker|
            if biker.rides.keys.include?(ride)
                bikers_that_completed << biker
            end
        end
        bikers_that_completed
    end

    def best_time(ride)
        bikers_that_completed(ride).min_by do |biker|
            biker.personal_record(ride)
        end
    end

    def bikers_eligible(ride)
        @bikers.find_all do |biker|
            biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance >= ride.total_distance
        end
    end

    def record_group_ride(ride)
        group_ride = {}
        group_ride[:start_time] = Time.now.to_i
        group_ride[:ride] = ride
        group_ride[:members] = bikers_eligible(ride)
        @group_rides << group_ride
        group_ride
    end

    def finish_group_ride(biker, group_ride)
        finish_time = biker.finish_time
        total_time = (((group_ride[:start_time] - finish_time).to_f / 60.0) / 60.0).round(1)
        biker.log_ride(group_ride[:ride], total_time)
    end 

end