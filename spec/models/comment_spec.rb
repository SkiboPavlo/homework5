require 'rails_helper'

describe Comment, type: :model do
  describe '#relations' do
    it { is_expected.to belong_to(:event) }
  end
end
