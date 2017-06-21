require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'PUT update/:id' do
    let(:attr) do
      { role: 'lawyer' }
    end

    before(:each) do
      put :update, id: @user.id, user: attr
      @user.reload
    end

    it { expect(response).to redirect_to(@user) }
    it { expect(@user.title).to eql attr[:title] }
  end
end
