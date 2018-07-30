require 'rails_helper'

RSpec.describe Trail do
  let(:trail) { Trail.new(
    name: 'Sample Trail',
    street: '789 Street Road',
    city: 'Boston',
    state: 'RI',
    length: '8'
  ) }

  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        expect(trail).to be_valid
        trail.name = nil
        expect(trail).to_not be_valid
      end
    end

    describe 'street' do
      it 'must be present' do
        expect(trail).to be_valid
        trail.street = nil
        expect(trail).to_not be_valid
      end
    end

    describe 'city' do
      it 'must be present' do
        expect(trail).to be_valid
        trail.city = nil
        expect(trail).to_not be_valid
      end
    end

    describe 'state' do
      it 'must be present' do
        expect(trail).to be_valid
        trail.state = nil
        expect(trail).to_not be_valid
      end
    end

    describe 'length' do
      it 'must be present' do
        expect(trail).to be_valid
        trail.length = nil
        expect(trail).to_not be_valid
      end
    end
  end
end
