require './lib/ride'
require 'pry'

Rspec.describe Ride do
    describe '#initialize' do
        it 'exists' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

            expect(ride1).to be_a(Ride)
        end

        it 'has a name' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

            expect(ride1.name).to eq("Walnut Creek Trail")
        end

        it 'has a distance' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

            expect(ride1.distance).to eq(10.7)
        end

        it 'has a terrain' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

            expect(ride1.terrain).to eq(:hills)
        end

        it 'can tell you if its a loop' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

            expect(ride1.loop?).to eq(false)
        end
    end

    describe '#total_distance' do
        it 'will tell you the total distance of the ride based on whether or not it is a loop' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            expect(ride1.total_distance).to eq(21.4)
            expect(ride2.total_distance).to eq(14.9)
        end
    end
end

