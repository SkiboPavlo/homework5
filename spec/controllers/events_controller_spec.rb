require 'rails_helper'

describe EventsController, type: :controller do
  let(:event) { Event.create(name: 'party_hard') }

  describe 'GET #new' do
    it 'comment is new record' do
      get :new

      expect(event).to be_new_record
      expect(event).to be_kind_of(Event)
    end

    it 'renders new template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
  end

  describe ' #index' do
    it "populates an array of contacts" do
      get :index

      expect(:event).to eq([event])
    end
  end

  describe ' #update' do
  end

  describe ' #destroy' do
  end

  describe ' #apply' do
  end

  describe ' #show' do
  end
end
