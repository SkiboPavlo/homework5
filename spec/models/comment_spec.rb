require 'rails_helper'

describe Comment do
  describe '#relations' do
    it { is_expected.to belong_to(:event) }
  end
end
