require 'rails_helper'

describe Event do
  describe 'relations' do
    it { is_expected.to have_and_belong_to_many(:users) }
    # it { should have_and_belong_to_many(:users) }
  end
end
