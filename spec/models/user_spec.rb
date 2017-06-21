require 'rails_helper'

describe User do
  let(:user) { User.create(email: 'test@test.com', role: 'attendee', event_id: 1) }

  describe 'relations' do
    # it { is_expected.to have_and_belong_to_many(:events) }
    it { should have_and_belong_to_many(:events) }
  end

  describe 'admin?' do
    context 'user role is eq to admin' do
      it 'return true' do
        user.role = 'admin'
        expect(user.admin?).to be true
      end

      it 'return false' do
        expect(user.admin?).to be false
      end
    end
  end
end
