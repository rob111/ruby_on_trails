require 'rails_helper'

RSpec.describe Review do
  let(:user) do
    User.new({
      username: 'Steve',
      email: 'steve@hotmail.com',
      password: 'password1'
    })
  end
  
  let(:trail) do
    Trail.new({
      name: 'Sameple Trail',
      street: '789 Street Road',
      city: 'Boston',
      state: 'RI',
      length: '8'
    })
  end
  
  let(:review) do
    Review.new({
      rating: 4,
      trail: trail,
      user: user
    })
  end
  
  describe 'validations' do
    describe 'rating' do
      it 'must be present' do
        expect(review).to be_valid
        review.rating = nil
        expect(review).to_not be_valid
      end
    end
  end
end
