require 'rails_helper'

describe Event do
  let(:user_1) { User.create(email: 'test@test.com', password: '123456') }
  let(:user_2) { User.create(email: '123@test.com', password: 'attendee') }
  let(:com) { Comment.create(description: 'ocean_plaza') }
  let(:event) { Event.create(name: 'party_hard') }

  describe '#relations' do
    it { is_expected.to have_and_belong_to_many(:users) }
    it { is_expected.to have_many(:comments) }
  end

  describe '#admin' do
    it 'return list of users email' do
      event.users << user_1
      event.users << user_2
      expect(event.admin).to eq(['test@test.com', '123@test.com'])
    end

    it "don't return list of users email" do
      expect(event.admin).not_to eq(['test@test.com', '123@test.com'])
    end
  end

  describe '#comment' do
    it 'return list of users comments' do
      event.comments << com
      expect(event.comment).to eq(['ocean_plaza'])
    end

    it "don't return list of users comments" do
      expect(event.comment).to eq([])
    end
  end
end
