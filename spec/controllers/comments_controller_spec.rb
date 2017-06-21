require 'rails_helper'

describe CommentsController, type: :controller do
  let(:event) { Event.create(name: 'party_hard') }
  let(:comment) { Comment.create(description: 'ocean_plaza', event_id: event.id) }

  describe 'GET #new' do
    it 'comment is new record' do
      get :new, params: { event_id: event.id }

      expect(comment).to be_new_record
      expect(comment).to be_a_new(Comment)
    end
  end

  describe 'POST #create' do
    it 'creates a new comment' do
      post :create, params: { event_id: event.id }

      expect(event.comments.count).to eq 1
    end

    it 'redirects to the event' do
      post :create, comment: { event_id: event.id }

      expect(response).to redirect_to Event.first
    end
  end
end
