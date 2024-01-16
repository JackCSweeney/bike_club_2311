require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'pry'

RSpec.describe BikeClub do
    describe '#initialize' do
        it 'exists' do
            bike_club = BikeClub.new("Club")

            expect(bike_club).to be_a(BikeClub)
        end

        it 'has a name' do
            bike_club = BikeClub.new("Club")

            expect(bike_club.name).to eq("Club")
        end

        it 'starts with no bikers' do
            bike_club = BikeClub.new("Club")
            
            expect(bike_club.bikers).to eq([])
        end
    end

    describe '#add_biker(biker)' do
        it 'can add bikers to the club' do
            bike_club = BikeClub.new("Club")
            biker = Biker.new("Kenny", 30)
            biker2 = Biker.new("Athena", 15)

            expect(bike_club.add_biker(biker)).to eq([biker])

            bike_club.add_biker(biker2)

            expect(bike_club.bikers).to eq([biker, biker2])
        end
    end

    describe '#most_rides' do
        it 'can tell you which biker in the club has logged the most rides' do
            biker = Biker.new("Kenny", 30)
            biker2 = Biker.new("Athena", 15)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)
            biker2.learn_terrain!(:gravel)
            biker2.learn_terrain!(:hills)
            
            biker2.log_ride(ride1, 91.1)
            
            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride2, 60.9)
            biker.log_ride(ride2, 61.6)

            expect(bike_club.most_rides).to eq(biker)
        end
    end

    describe '#best_time(ride)' do
        it 'can tell you which biker has the best time on the given ride' do
            biker = Biker.new("Kenny", 30)
            biker2 = Biker.new("Athena", 15)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)
            biker2.learn_terrain!(:gravel)
            biker2.learn_terrain!(:hills)
            
            biker2.log_ride(ride1, 91.1)
            
            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride2, 60.9)
            biker.log_ride(ride2, 61.6)
            
            expect(bike_club.best_time(ride1)).to eq(biker2)
            expect(bike_club.best_time(ride2)).to eq(biker)
        end
    end
end

