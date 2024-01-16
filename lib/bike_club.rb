class BikeClub

    attr_reader :name,
                :bikers

    def initialize(name)
        @name = name
        @bikers = []
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
            biker.log_ride(ride, 'Eligibility Test')
        end
    end

end