class Ride

    attr_reader :name,
                :distance,
                :loop,
                :terrain

    def initialize(info)
        @name = info[:name]
        @distance = info[:distance]
        @loop = info[:loop]
        @terrain = info[:terrain]
    end

end