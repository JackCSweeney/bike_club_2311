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

            bike_club.add_biker(biker)
            bike_club.add_biker(biker2)

            expect(bike_club.bikers).to eq([biker, biker2])
        end
    end
end

