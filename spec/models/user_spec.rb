require 'rails_helper'

describe User, type: :model do
  let(:user) { User.create(email: 'test@test.com', role: 'attendee') }

  describe '#relations' do
    it { is_expected.to have_and_belong_to_many(:events) }
  end

  describe '#admin?' do
    context 'user role is eq to admin' do
      it 'return true' do
        user.role = 'admin'
        expect(user.admin?).to be true
      end
    end

    context 'user role is not eq to admin' do
      it 'return false' do
        expect(user.admin?).to be false
      end
    end
  end

  describe '#attendee?' do
    context 'user role is eq to attendee' do
      it 'return true' do
        expect(user.attendee?).to be true
      end
    end

    context 'user role is  not eq to attendee' do
      it 'return false' do
        user.role = 'admin'
        expect(user.attendee?).to be false
      end
    end
  end
end
