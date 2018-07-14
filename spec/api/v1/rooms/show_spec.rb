require 'rails_helper'

RSpec.describe "rooms#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rooms/#{room.id}",
      params: params
  end

  describe 'basic fetch' do
    let!(:room) { create(:room) }

    it 'serializes the resource correctly' do
      make_request
      assert_payload(:room, room, json_item)
    end
  end
end
