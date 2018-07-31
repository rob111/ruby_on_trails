require 'rails_helper'

RSpec.describe User do
  let(:user) { User.new(
    username: 'Steve',
    email: 'steve@hotmail.com',
    password: 'password1'
  ) }

  describe 'validations' do
    describe 'username' do
      it 'must be present' do
        expect(user).to be_valid
        user.username = nil
        expect(user).to_not be_valid
      end
    end

    describe 'email' do
      it 'must be present' do
        expect(user).to be_valid
        user.email = nil
        expect(user).to_not be_valid
      end
    end

    describe 'password' do
      it 'must be present' do
        expect(user).to be_valid
        user.password = nil
        expect(user).to_not be_valid
      end
    end
  end

  describe 'methods' do
    describe 'admin?' do
      it 'should not be admin' do
        expect(user.admin?).to eq(false)
      end
    end

    describe '#to_param' do
      it 'should return the username of the user' do
        expect(user.to_param).to eq('Steve')
      end
    end
  end
end
