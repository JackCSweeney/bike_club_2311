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
end

