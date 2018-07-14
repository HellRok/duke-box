require 'rails_helper'

RSpec.describe "rooms#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/rooms/#{room.id}"
  end

  describe 'basic destroy' do
    let!(:room) { create(:room) }

    it 'updates the resource' do
      expect {
        make_request
      }.to change { Room.count }.by(-1)

      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
