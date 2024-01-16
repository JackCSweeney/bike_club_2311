require './lib/biker'
require './lib/ride'
require 'pry'

RSpec.describe Biker do
    describe '#initialize' do
        it 'exists' do
            biker = Biker.new("Kenny", 30)

            expect(biker).to be_a(Biker)
        end

        it 'has a name' do
            biker = Biker.new("Kenny", 30)

            expect(biker.name).to eq("Kenny")
        end

        it 'has a max distance' do
            biker = Biker.new("Kenny", 30)

            expect(biker.max_distance).to eq(30)
        end

        it 'starts with no rides completed' do
            biker = Biker.new("Kenny", 30)

            expect(biker.rides).to eq({})
        end

        it 'starts with no acceptable_terrain' do
            biker = Biker.new("Kenny", 30)

            expect(biker.acceptable_terrain).to eq([])
        end
    end

    describe '#learn_terrain!' do
        it 'can learn new acceptable terrain' do
            biker = Biker.new("Kenny", 30)

            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)

            expect(biker.acceptable_terrain).to eq([:gravel, :hills])
        end
    end

    describe '#log_ride(ride, time)' do
        it 'will log rides completed and the times they were completed in' do
            biker = Biker.new("Kenny", 30)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)
            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride1, 91.1)
            biker.log_ride(ride2, 60.9)
            biker.log_ride(ride2, 61.6)

            expect(biker.rides).to eq({ride1 => [92.5, 91.1], ride2 => [60.9, 61.6]})
        end

        it 'will not log a ride if the biker does not know the terrain yet' do
            biker2 = Biker.new("Athena", 15)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            biker2.log_ride(ride1, 97.0)
            biker2.log_ride(ride2, 67.0)
            
            expect(biker2.rides).to eq({})
        end

        it 'will not log a ride if the biker knows the terrain but doesnt have max distance large enough' do
            biker2 = Biker.new("Athena", 15)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            biker2.learn_terrain!(:gravel)
            biker2.learn_terrain!(:hills)

            biker2.log_ride(ride1, 97.0)
            biker2.log_ride(ride2, 65.0)

            expect(biker2.rides).to eq({ride2 => [65.0]})
        end
    end

    describe '#personal_record(ride)' do
        it 'will return the fastest time a biker has completed a ride' do
            biker = Biker.new("Kenny", 30)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)
            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride1, 91.1)
            biker.log_ride(ride2, 60.9)
            biker.log_ride(ride2, 61.6)

            expect(biker.personal_record(ride1)).to eq(91.1)
            expect(biker.personal_record(ride2)).to eq(60.9)
        end
    end

end

