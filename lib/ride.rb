class Ride

    attr_reader :name,
                :distance,
                :terrain

    def initialize(info)
        @name = info[:name]
        @distance = info[:distance]
        @loop = info[:loop]
        @terrain = info[:terrain]
    end

    def loop?
        @loop
    end

    def total_distance
        @loop ? @distance : (@distance * 2).round(1)
    end

end